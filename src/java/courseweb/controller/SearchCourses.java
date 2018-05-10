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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Riccardo
 */
public class SearchCourses extends CourseWebBaseController {
    
    private void action_error(HttpServletRequest request, HttpServletResponse response) {
        
        if(request.getAttribute("exception") != null) {
            (new FailureResult(getServletContext())).activate((Exception) request.getAttribute("exception"), request, response);
        } else {
            (new FailureResult(getServletContext())).activate((String) request.getAttribute("message"), request, response);
        }
        
    }
    
    //Azione compiuta al caricamento della pagina
    private void action_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException, ServletException {       
        
        TemplateResult result = new TemplateResult(getServletContext());
        if(request.getAttribute("lang").equals("eng")){
            request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
            result.activate("/eng/search_courses.html.ftl", request, response);  

        } else if(request.getAttribute("lang").equals("ita")){
            request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
            result.activate("/ita/search_courses.html.ftl", request, response); 

        } else {
            request.setAttribute("message", "Illegal language");
            action_error(request, response);

        }   
         
    }
    
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        
        System.out.println("lingua processrequest searchcourses: " + request.getParameter("lang"));
        HttpSession s = (HttpSession) request.getAttribute("session"); 
        
        
        System.out.println("lingua processrequest searchcourses2: " + s.getAttribute("lang")); 
        
        /* SICUREZZA HTTPS DA CONTROLLARE IN TOMCAT !! */
        boolean secure = SecurityLayer.checkHttps(request); 
        
        if(!secure){
            SecurityLayer.redirectToHttps(request, response);
        } else {
            
            System.out.println("lang2: " + request.getAttribute("lang"));
            
            String lang;
            
            try {
                if(request.getAttribute("lang") == null) {
                    
                    System.out.println("lang3: " + request.getAttribute("lang"));
                    
                    lang = request.getParameter("lang");
                
                    if(lang == null || lang.equals("")) {
                        
                    } else if(lang.equals("ita") || lang.equals("eng")) {
                        request.setAttribute("lang", lang);
                    } else {
                        request.setAttribute("lang", "eng");   
                    }
                    
                }
                
                System.out.println("lang4: " + request.getAttribute("lang"));
                
                request.setAttribute("page", "login");
                
                if(request.getParameter("login") != null){
                    //action_login(request, response); 
                } else if(request.getParameter("login_guest") != null){
                    //action_login_guest(request, response); 
                } else {
                    action_default(request, response); 
                }
                
            } catch(TemplateManagerException ex){
                request.setAttribute("exception", ex);
                action_error(request, response);
            }
            
        }
        
    }
    
    @Override
    public String getServletInfo() {
        return "SearchCourses servlet";

    }
    
}
