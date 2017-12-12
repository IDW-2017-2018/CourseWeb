/*
 * 
 */
package courseweb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import framework.result.FailureResult;
import framework.result.TemplateResult;
import framework.result.TemplateManagerException;
import framework.data.DataLayerException;
import framework.security.SecurityLayer;

import courseweb.data.model.Utente;
import courseweb.data.model.CourseWebDataLayer;

/**
 *
 * @author valen
 */
public class Login extends CourseWebBaseController {
    
    private void action_error(HttpServletRequest request, HttpServletResponse response) {
        
        if(request.getAttribute("exception") != null) {
            (new FailureResult(getServletContext())).activate((Exception) request.getAttribute("exception"), request, response);
        } else {
            (new FailureResult(getServletContext())).activate((String) request.getAttribute("message"), request, response);
        }
        
    }
    
    private void action_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {       
                   
        TemplateResult result = new TemplateResult(getServletContext());
        if(request.getParameter("lang").equals("eng")){
            result.activate("eng/login.ftl.html", request, response);  
            
        } else if(request.getParameter("lang").equals("ita")){
            result.activate("ita/login.ftl.html", request, response); 
            
        } else {
            request.setAttribute("message", "Illegal language");
            action_error(request, response);
            
        }               
        
    }
    
    private void action_login(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        try {
            TemplateResult res = new TemplateResult(getServletContext());
        
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Utente utente;
            
            if(email != null && password != null) {
                utente = ((CourseWebDataLayer)request.getAttribute("datalayer")).getUtente(email);
                
                if(utente == null) {
                    request.setAttribute("message", "Email not correct");
                    action_error(request, response);
                    
                } else {
                    
                    if(password.equals(utente.getPassword())) {
                        HttpSession session = SecurityLayer.createSession(request, utente.getEmail(), utente.getId());
                        request.setAttribute("utente", utente);
                        
                        if(request.getParameter("lang").equals("eng")) {
                            res.activate("eng/search_courses", request, response);
                            
                        } else if(request.getParameter("lang").equals("ita")) {
                            res.activate("ita/search_courses", request, response);
                            
                        } else {
                            request.setAttribute("message", "Illegal language");
                            action_error(request, response); 
                        }
                                                
                    } else {
                        request.setAttribute("message", "Password not correct");
                        action_error(request, response);
                    }
                    
                }
                
            } else {
                request.setAttribute("message", "Empty fields");
                action_error(request, response);
                
            }

        } catch(DataLayerException ex) {
            
            request.setAttribute("message", "Data access exception: " + ex.getMessage());
            action_error(request, response);
        
        }
    }
    
    //action_login_guest
    
    //processRequest
    
    @Override
    public String getServletInfo() {
        return "Login servlet";

    }
    
}
