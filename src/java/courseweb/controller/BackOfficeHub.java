/*
 * Classe BackOfficeHub
 */
package courseweb.controller;

import courseweb.data.model.CourseWebDataLayer;
import courseweb.data.model.Utente;
import courseweb.utils.LogComparatorByDateDesc;
import framework.data.DataLayerException;
import framework.result.FailureResult;
import framework.result.TemplateManagerException;
import framework.result.TemplateResult;
import framework.security.SecurityLayer;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Riccardo
 */
public class BackOfficeHub extends CourseWebBaseController {
    
    private void action_error(HttpServletRequest request, HttpServletResponse response){
        if(request.getAttribute("exception") != null){
            (new FailureResult(getServletContext())).activate((Exception)request.getAttribute("exception"), request, response);
        } else {
            (new FailureResult(getServletContext())).activate((String)request.getAttribute("message"), request, response);
        }
    }
    
    private void action_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
        
            
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                result.activate("/eng/backoffice_hub.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                result.activate("/ita/backoffice_hub.html.ftl", request, response);
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
              
    }
    
    private void action_hub_aggiungi_corso(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {            
        
        HttpSession session = (HttpSession) request.getAttribute("session"); 
        session.setAttribute("lang", request.getAttribute("lang"));                            
        request.setAttribute("session", session); 
        
        
        try {
            if(request.getAttribute("session") != null){
                if(((Utente)session.getAttribute("utente")).getTipoUtente().equals("amministratore")) {
                    response.sendRedirect(response.encodeURL(request.getContextPath() + "/backofficecourse?action=add_course&lang=" + request.getAttribute("lang")));
                }
                else{
                    request.setAttribute("message", "not permitted");
                    action_error(request, response);
                    return;
                }
            }
        } catch(IOException e){
            request.setAttribute("exception", e);
            action_error(request, response); 
        }                      
                        
    }
    
    private void action_hub_modifica_utente(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {

        HttpSession session = (HttpSession) request.getAttribute("session"); 
        session.setAttribute("lang", request.getAttribute("lang"));                            
        request.setAttribute("session", session); 
        
        try {
            
            response.sendRedirect(response.encodeURL(request.getContextPath() + "/backofficeuser?action=edit_user&lang=" + request.getAttribute("lang")));
            
        } catch(IOException e){
            request.setAttribute("exception", e);
            action_error(request, response); 
        } 
                 
    }    
        
    
    private void action_hub_modifica_corso(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {

        HttpSession session = (HttpSession) request.getAttribute("session"); 
        session.setAttribute("lang", request.getAttribute("lang"));                            
        request.setAttribute("session", session); 
        
        try {
            
            response.sendRedirect(response.encodeURL(request.getContextPath() + "/backofficecourse?action=edit_course&lang=" + request.getAttribute("lang")));
            
        } catch(IOException e){
            request.setAttribute("exception", e);
            action_error(request, response); 
        } 

    }
    
    private void action_hub_aggiungi_utente(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {

        HttpSession session = (HttpSession) request.getAttribute("session"); 
        session.setAttribute("lang", request.getAttribute("lang"));                            
        request.setAttribute("session", session); 
        
        try {
            
            response.sendRedirect(response.encodeURL(request.getContextPath() + "/backofficeuser?action=add_user&lang=" + request.getAttribute("lang")));
            
        } catch(IOException e){
            request.setAttribute("exception", e);
            action_error(request, response); 
        } 

    }    
    
        private void action_hub_log(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
        
        CourseWebDataLayer datalayer = (CourseWebDataLayer) request.getAttribute("datalayer");
        
        
        try {
            
            List<String> items = datalayer.getLogMessage();
            
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                items.sort(new LogComparatorByDateDesc());
                request.setAttribute("hub_log", "true");
                request.setAttribute("items", items);
                result.activate("/eng/log.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                items.sort(new LogComparatorByDateDesc());
                request.setAttribute("hub_log", "true");
                request.setAttribute("items", items);               
                result.activate("/ita/log.html.ftl", request, response);
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
        }
        catch (DataLayerException exc){
            exc.printStackTrace();
            request.setAttribute("exception",exc);
            action_error(request,response);
        }
              
    }
      
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        
        HttpSession s = (HttpSession) request.getAttribute("session"); 
        
        /* SICUREZZA HTTPS DA CONTROLLARE IN TOMCAT !! */
        boolean secure = SecurityLayer.checkHttps(request); 
        
        if(!secure){
            SecurityLayer.redirectToHttps(request, response);
        } else {
            
            //session check
            if(s == null){
                //session not valid
                //redirect to login page

                try {

                    response.sendRedirect(response.encodeURL(request.getContextPath() + "/login?lang=" + request.getAttribute("lang")));

                } catch(IOException e){
                    request.setAttribute("exception", e);
                    action_error(request, response); 
                }

                return;
            }
            
            String lang;
            
            try {
                if(request.getAttribute("lang") == null) {
                    
                    lang = request.getParameter("lang");
                
                    if(lang == null || lang.equals("")) {
                        
                    } else if(lang.equals("ita") || lang.equals("eng")) {
                        request.setAttribute("lang", lang);
                    } else {
                        request.setAttribute("lang", "eng");   
                    }
                    
                }
                               
                request.setAttribute("style", "backoffice");
                request.setAttribute("page", "backofficehub");
                if(((Utente)s.getAttribute("utente")) == null){
                    request.setAttribute("message", "not permitted");
                    action_error(request,response);
                    return;
                }
                if(!(((Utente)s.getAttribute("utente")).getTipoUtente().equals("amministratore")||((Utente)s.getAttribute("utente")).getTipoUtente().equals("docente"))){
                  request.setAttribute("message", "not permitted");
                  action_error(request,response);
                  return;
                }
                
                if(request.getParameter("hub_aggiungi_corso") != null){
                  action_hub_aggiungi_corso(request,response);  
                }
                else if(request.getParameter("hub_modifica_corso") != null){
                  action_hub_modifica_corso(request,response);
                }
                else if(request.getParameter("hub_aggiungi_utente") != null){
                  action_hub_aggiungi_utente(request,response);   
                }
                else if(request.getParameter("hub_modifica_utente") != null){
                  action_hub_modifica_utente(request,response); 
                }
                else if(request.getParameter("hub_log") != null){
                  action_hub_log(request,response);
                }
                else
                    action_default(request, response);                                 
            } catch(TemplateManagerException ex){
                request.setAttribute("exception", ex);
                action_error(request, response);
            }
            
        }
        
    }
    
    @Override
    public String getServletInfo() {
        return "BackOfficeHub servlet";

    }
    
}
