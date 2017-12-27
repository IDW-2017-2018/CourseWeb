/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package courseweb.controller;

import framework.result.FailureResult;
import framework.result.TemplateManagerException;
import framework.result.TemplateResult;
import framework.security.SecurityLayer;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author valen
 */
public class Help extends CourseWebBaseController {
    
    private void action_error(HttpServletRequest request, HttpServletResponse response) {        
     
        if(request.getAttribute("exception") != null) {
            (new FailureResult(getServletContext())).activate((Exception) request.getAttribute("exception"), request, response);
        } else {
            (new FailureResult(getServletContext())).activate((String) request.getAttribute("message"), request, response);
        }
        
    }
    
    private void action_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext());
        if(request.getAttribute("lang").equals("eng")) {
            request.setAttribute("navbar_tpl", "/eng/not_logged_navbar.html.ftl");
            result.activate("/eng/help.html.ftl", request, response);
        } else if(request.getAttribute("lang").equals("ita")) {
            request.setAttribute("navbar_tpl", "/ita/not_logged_navbar.html.ftl");
            result.activate("/ita/help.html.ftl", request, response);
        } else {
            request.setAttribute("message", "Illegal language");
            action_error(request, response);
        }
    
    }
    
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        
        boolean secure = SecurityLayer.checkHttps(request);
        
        if(!secure){
            SecurityLayer.redirectToHttps(request, response);
        } else {
            String lang;
            
            try {
                if(request.getAttribute("lang") == null) {
                    
                    lang = request.getParameter("lang");
                
                    if(lang == null || lang.equals("")) {
                        Locale l = request.getLocale();
                        if(l.getLanguage().equals("it")){
                            //Carichiamo la pagina in italiano di default
                            request.setAttribute("lang", "ita");
                        } else if(l.getLanguage().equals("en")){
                            //Carichiamo la pagina in inglese di default
                            request.setAttribute("lang", "eng");
                        } else {
                            //Altra lingua, carichiamo la pagina in inglese
                            request.setAttribute("lang", "eng");
                        }
                    } else if(lang.equals("ita") || lang.equals("eng")) {
                        request.setAttribute("lang", lang);
                    } else {
                        request.setAttribute("lang", "eng");   
                    }
                    
                }
                
                request.setAttribute("page", "help");
                action_default(request, response);
                
            } catch(TemplateManagerException ex){
                request.setAttribute("exception", ex);
                action_error(request, response);
            }
        }
        
    }
    
    @Override
    public String getServletInfo() {
        return "Help servlet";

    }
    
}
