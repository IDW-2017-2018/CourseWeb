/*
 * Classe controller Login
 */
package courseweb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;

import framework.result.FailureResult;
import framework.result.TemplateResult;
import framework.result.TemplateManagerException;
import framework.data.DataLayerException;
import framework.security.SecurityLayer;

import courseweb.data.model.Utente;
import courseweb.data.model.CourseWebDataLayer;
import courseweb.data.impl.UtenteImpl; 

import java.util.Locale;
import java.util.UUID; 

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
    
    //Azione compiuta al caricamento della pagina
    private void action_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException, ServletException {       
        
        boolean secure = SecurityLayer.checkHttps(request); 
        if(!secure){
            SecurityLayer.redirectToHttps(request, response);
        } else {
            
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

            TemplateResult result = new TemplateResult(getServletContext());
            if(request.getParameter("lang").equals("eng")){
                result.activate("eng/login.html.ftl", request, response);  

            } else if(request.getParameter("lang").equals("ita")){
                result.activate("ita/login.html.ftl", request, response); 

            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response);

            }   
        }
        
    }
    
    //Azione compiuta al login di un utente registrato
    private void action_login(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        try {
            TemplateResult res = new TemplateResult(getServletContext());
        
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Utente utente;
            
            if((email != null) && (password != null) && (!password.equals("")) && (!email.equals(""))) {
                utente = ((CourseWebDataLayer)request.getAttribute("datalayer")).getUtente(email);
                
                if(utente == null) {
                    request.setAttribute("message", "Email not correct");
                    action_error(request, response);
                    
                } else {
                    
                    if(password.equals(utente.getPassword())) {
                        HttpSession session = SecurityLayer.createSession(request, utente.getEmail(), utente.getId());
                        request.setAttribute("utente", utente);
                        
                        /* In base al tipo utente caricare pagina associata */
                        switch(utente.getTipoUtente()){
                            case "docente":
                                //Codice per caricare la pagina ai docenti
                                /*
                                if(request.getParameter("lang").equals("eng")) {
                                    res.activate("eng/search_courses.html.ftl", request, response);

                                } else if(request.getParameter("lang").equals("ita")) {
                                    res.activate("ita/search_courses.html.ftl", request, response);

                                } else {
                                    request.setAttribute("message", "Illegal language");
                                    action_error(request, response); 
                                }*/
                                break;
                                
                            case "amministratore":
                                //Codice per caricare la pagina agli amministratori
                                /*
                                if(request.getParameter("lang").equals("eng")) {
                                    res.activate("eng/search_courses.html.ftl", request, response);

                                } else if(request.getParameter("lang").equals("ita")) {
                                    res.activate("ita/search_courses.html.ftl", request, response);

                                } else {
                                    request.setAttribute("message", "Illegal language");
                                    action_error(request, response); 
                                }*/
                                break;
                            
                            case "anonimo":
                                //l'anonimo non dovrebbe essere qui!
                                request.setAttribute("message", "Email and password not correct");
                                action_error(request, response);
                                break;
                            
                            default:
                                //utente illegale
                                request.setAttribute("message", "Email and password not correct");
                                action_error(request, response);
                                break;
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
    
    //Azione compiuta al login di un utente anonimo
    private void action_login_guest(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        try {
            
            TemplateResult res = new TemplateResult(getServletContext());
            
            CourseWebDataLayer datalayer = ((CourseWebDataLayer)request.getAttribute("datalayer")); 
            Utente guest = new UtenteImpl(datalayer); 
            guest.setEmail(UUID.randomUUID().toString().replace("-", ""));
            guest.setTipoUtente("anonimo");
            
            datalayer.storeUtenteById(guest);
            
            HttpSession session = SecurityLayer.createSession(request, guest.getEmail(), guest.getId()); 
            request.setAttribute("utente", guest);
            
            //caricamento pagina search_courses
            if(request.getParameter("lang").equals("eng")) {
                res.activate("eng/search_courses.html.ftl", request, response);

            } else if(request.getParameter("lang").equals("ita")) {
                res.activate("ita/search_courses.html.ftl", request, response);

            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
            
        } catch(DataLayerException ex){
            request.setAttribute("message", "Data access exception: " + ex.getMessage());
            action_error(request, response);
        }
        
    }
    
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            if(request.getParameter("login") != null){
                action_login(request, response); 
            } else if(request.getParameter("login_guest") != null){
                action_login_guest(request, response); 
            } else {
                action_default(request, response); 
            }
        } catch(TemplateManagerException ex){
            request.setAttribute("exception", ex);
            action_error(request, response);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Login servlet";

    }
    
}
