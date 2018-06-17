/*
 * Class BackOfficeUser
 */
package courseweb.controller;

import courseweb.utils.UtenteComparatorByCognome;
import courseweb.data.impl.UtenteImpl;
import courseweb.data.model.CourseWebDataLayer;
import courseweb.data.model.Utente;
import framework.data.DataLayerException;
import framework.result.FailureResult;
import framework.result.TemplateManagerException;
import framework.result.TemplateResult;
import framework.security.SecurityLayer;
import framework.security.SecurityLayerException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Flavio
 */
public class BackOfficeUser extends CourseWebBaseController {
    
    private void action_error(HttpServletRequest request, HttpServletResponse response){
        if(request.getAttribute("exception") != null){
            (new FailureResult(getServletContext())).activate((Exception)request.getAttribute("exception"), request, response);
        } else {
            (new FailureResult(getServletContext())).activate((String)request.getAttribute("message"), request, response);
        }
    }
    
    private void action_aggiungi_utente(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        try{
            String email = request.getParameter("utente_email");
            String password = request.getParameter("utente_password");
            String ripetiPassword = request.getParameter("utente_ripeti_password");
            String nome = request.getParameter("utente_nome");
            String cognome = request.getParameter("utente_cognome");
            String tipo_utente = request.getParameter("utente_tipo_utente");
            
            email = SecurityLayer.addSlashes(email);
            password = SecurityLayer.addSlashes(password);
            ripetiPassword = SecurityLayer.addSlashes(ripetiPassword);
            nome = SecurityLayer.addSlashes(nome);
            cognome = SecurityLayer.addSlashes(cognome);
         
            if(email.equals("")||password.equals("")||ripetiPassword.equals("")||nome.equals("")||cognome.equals("")){
                request.setAttribute("message","empty fields");
                action_error(request,response);
                return;
            }
            
            if(!password.equals(ripetiPassword)){
                request.setAttribute("message","passwords don't match");
                action_error(request,response);
                return;
            }
            
            CourseWebDataLayer datalayer = ((CourseWebDataLayer) request.getAttribute("datalayer"));

            Utente utente = new UtenteImpl(datalayer);
            utente.setEmail(email);
            utente.setPassword(SecurityLayer.md5String(password));
            utente.setNome(nome);
            utente.setCognome(cognome);
            utente.setTipoUtente(tipo_utente);
            
            datalayer.storeUtenteByEmail(utente);
            datalayer.storeLogMessage("L'utente " + ((Utente)((HttpSession) request.getAttribute("session")).getAttribute("utente")).getEmail() + " ha aggiunto il docente " + email);
            response.sendRedirect(response.encodeURL(request.getContextPath() + "/backofficehub?lang=" + request.getAttribute("lang")));
                        
        }
        catch(SecurityLayerException|DataLayerException|IOException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
    }
    
    private void action_modifica_utente(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
       
        if(request.getParameter("id") == null) {
            request.setAttribute("message","not a valid user id");
            action_error(request,response);
            return;
        }
        
        try {
            
            int id = Integer.parseInt(request.getParameter("id")); 
            boolean edited = false; 
            
            String email = request.getParameter("utente_email");
            String password = request.getParameter("utente_password");
            String ripetiPassword = request.getParameter("utente_ripeti_password");
            String nome = request.getParameter("utente_nome");
            String cognome = request.getParameter("utente_cognome");
            String tipo_utente = request.getParameter("utente_tipo_utente");
            
            email = SecurityLayer.addSlashes(email);
            password = SecurityLayer.addSlashes(password);
            ripetiPassword = SecurityLayer.addSlashes(ripetiPassword);
            nome = SecurityLayer.addSlashes(nome);
            cognome = SecurityLayer.addSlashes(cognome);
         
            if(email.equals("") && password.equals("") && ripetiPassword.equals("") && nome.equals("") && cognome.equals("")){
                request.setAttribute("message","empty fields");
                action_error(request,response);
                return;
            }
            
            CourseWebDataLayer datalayer = ((CourseWebDataLayer) request.getAttribute("datalayer"));
            
            Utente utente = datalayer.getUtente(id);
            
            if(!email.equals("")){
                utente.setEmail(email);
                edited = true;
            }
            
            if(!password.equals("")){
                if(!password.equals(ripetiPassword)){
                    request.setAttribute("message","passwords don't match");
                    action_error(request,response);
                    return;
                }  
                utente.setPassword(SecurityLayer.md5String(password));
                edited = true;
            }
            
            if(!nome.equals("")){
                utente.setNome(nome);
                edited = true;
            }
            
            if(!cognome.equals("")){
                utente.setCognome(cognome);
                edited = true;
            }
            
            if(utente.getTipoUtente().equals(tipo_utente)){
                utente.setTipoUtente(tipo_utente);
                edited = true;
            }
            
            if(edited == true){
                datalayer.storeUtenteById(utente);
                datalayer.storeLogMessage("L'utente " + ((Utente)((HttpSession) request.getAttribute("session")).getAttribute("utente")).getEmail() + " ha modificato l'utente " + email);            
            }
            response.sendRedirect(response.encodeURL(request.getContextPath() + "/backofficehub?lang=" + request.getAttribute("lang")));
                       
        }
        catch(SecurityLayerException|DataLayerException|NumberFormatException|IOException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
    }
    
    private void action_aggiungi_utente_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
         
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                result.activate("/eng/backoffice_add_user.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                result.activate("/ita/backoffice_add_user.html.ftl", request, response);
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
                 
    }
    
    private void action_filter_modifica_utente(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
        List<Utente> utenti = new ArrayList<Utente>(); 
        
        String utente_nome = request.getParameter("utente_nome");
        String utente_cognome = request.getParameter("utente_cognome");
        String utente_email = request.getParameter("utente_email");
        String utente_tipo = request.getParameter("utente_tipo_utente");
        
        try {
            
            utenti = ((CourseWebDataLayer) request.getAttribute("datalayer")).getUtenti();
            
            if(!utente_email.equals("")){
                utenti = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraUtenti(utenti, "utente_email", utente_email); 
            }
                       
            if (!utente_nome.equals("")){
                utenti = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraUtenti(utenti, "utente_nome", utente_nome); 
            } 
            
            if (!utente_cognome.equals("")){
                utenti = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraUtenti(utenti, "utente_cognome", utente_cognome); 
            } 
            
            if (!utente_tipo.equals("")){
                utenti = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraUtenti(utenti, "utente_tipo_utente", utente_tipo); 
            }
    
        } catch(DataLayerException e){
            request.setAttribute("exception", e);
            action_error(request, response); 
            return;
        }
        
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                utenti.sort(new UtenteComparatorByCognome());
                request.setAttribute("utenti", utenti); 
                result.activate("/eng/backoffice_filter_edit_user.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                utenti.sort(new UtenteComparatorByCognome());
                request.setAttribute("utenti", utenti); 
                result.activate("/ita/backoffice_filter_edit_user.html.ftl", request, response);
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
                 
    }
    
    private void action_filter_modifica_utente_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
      
        try {
            
            List<Utente> utenti = ((CourseWebDataLayer) request.getAttribute("datalayer")).getDocenti();
           
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                utenti.sort(new UtenteComparatorByCognome());
                request.setAttribute("utenti", utenti); 
                result.activate("/eng/backoffice_filter_edit_user.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                utenti.sort(new UtenteComparatorByCognome());
                request.setAttribute("utenti", utenti); 
                result.activate("/ita/backoffice_filter_edit_user.html.ftl", request, response);
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
            
        } catch(DataLayerException e){
            request.setAttribute("exception", e);
            action_error(request, response); 
  
        } 
             
    }
    
    private void action_modifica_utente_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
        
        try {
            
            if(request.getParameter("id") == null) {
                request.setAttribute("message","not a valid user id");
                action_error(request,response);
                return;
            }
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                request.setAttribute("utente", ((CourseWebDataLayer) request.getAttribute("datalayer")).getUtente(id)); 
                result.activate("/eng/backoffice_edit_user.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                request.setAttribute("utente", ((CourseWebDataLayer) request.getAttribute("datalayer")).getUtente(id)); 
                result.activate("/ita/backoffice_edit_user.html.ftl", request, response);
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
            
        } catch(DataLayerException|NumberFormatException e){
            request.setAttribute("exception", e);
            action_error(request, response); 
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
                request.setAttribute("page", "backofficeuser");
                if(((Utente)s.getAttribute("utente")) == null){
                    request.setAttribute("message", "not permitted");
                    action_error(request,response);
                    return;
                }
                if(!(((Utente)s.getAttribute("utente")).getTipoUtente().equals("amministratore"))){
                  request.setAttribute("message", "not permitted");
                  action_error(request,response);
                  return;
                }
                
                String action = request.getParameter("action"); 
                request.setAttribute("action", action);
                if(request.getParameter("id") != null)
                    request.setAttribute("id", request.getParameter("id"));
                else{
                    request.setAttribute("id", null);
                }
                    
                
                if(action == null){
                    request.setAttribute("message", "Illegal action");
                    action_error(request, response);
                    return;
                }
                    
                if(action.equals("add_user") && !(request.getParameter("aggiungi_utente") != null)){
                  action_aggiungi_utente_default(request,response);  
                }
                else if(action.equals("edit_user") && (request.getParameter("filtra") != null) && (!(request.getParameter("id") != null)) && !(request.getParameter("modifica_utente") != null)){
                  action_filter_modifica_utente(request,response);
                }
                else if(action.equals("edit_user") && (!(request.getParameter("filtra") != null)) && (!(request.getParameter("id") != null)) && !(request.getParameter("modifica_utente") != null)){
                  action_filter_modifica_utente_default(request,response);
                }
                else if(action.equals("edit_user") && (request.getParameter("id") != null) && !(request.getParameter("modifica_utente") != null)){
                  action_modifica_utente_default(request,response);
                }
                else if(action.equals("add_user") && (request.getParameter("aggiungi_utente") != null)){
                  action_aggiungi_utente(request,response);   
                }
                else if(action.equals("edit_user") && (request.getParameter("id") != null) && (request.getParameter("modifica_utente") != null)){
                  action_modifica_utente(request,response); 
                }
                else {
                    request.setAttribute("message", "Illegal action");
                    action_error(request, response);
                  
                }
            
            } catch(TemplateManagerException ex){
                request.setAttribute("exception", ex);
                action_error(request, response);
            }
            
        }
        
    }
    
    @Override
    public String getServletInfo() {
        return "BackOfficeUser servlet";

    }
    
}
