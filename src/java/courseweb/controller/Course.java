/*
 * Classe Course
 */
package courseweb.controller;

import courseweb.data.model.Corso;
import courseweb.data.model.CourseWebDataLayer;
import framework.data.DataLayerException;
import framework.result.FailureResult;
import framework.result.TemplateManagerException;
import framework.result.TemplateResult;
import framework.security.SecurityLayer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Riccardo
 */
public class Course extends CourseWebBaseController {
    
    private void action_error(HttpServletRequest request, HttpServletResponse response){
        if(request.getAttribute("exception") != null){
            (new FailureResult(getServletContext())).activate((Exception)request.getAttribute("exception"), request, response);
        } else {
            (new FailureResult(getServletContext())).activate((String)request.getAttribute("message"), request, response);
        }
    }
    
    private void action_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
        
        try {
            
            String id_corso = (String) request.getParameter("id");
            Corso corso = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorso(Integer.parseInt(id_corso));

            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
             
                request.setAttribute("corso", corso);
                request.setAttribute("corso_anni", ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsoByNomeVersioni(corso.getNome()));
                request.setAttribute("docenti", corso.getDocentiCorso());
                
                request.setAttribute("corsi_laurea", ((CourseWebDataLayer) request.getAttribute("datalayer")).getCFU(corso));
                
                request.setAttribute("libri_testo", corso.getLibriTestoCorso());
                request.setAttribute("corsi_propedeutici", corso.getCorsiPropedeuticiCorso());
                request.setAttribute("corsi_mutuati", corso.getCorsiMutuatiCorso());
                request.setAttribute("corsi_integrati", corso.getCorsiIntegratiCorso());
                request.setAttribute("corso_materiali", corso.getMaterialiCorso());
                
                result.activate("/eng/course.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                
                request.setAttribute("corso", corso);
                request.setAttribute("corso_anni", ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsoByNomeVersioni(corso.getNome()));
                request.setAttribute("docenti", corso.getDocentiCorso());
                
                request.setAttribute("corsi_laurea", ((CourseWebDataLayer) request.getAttribute("datalayer")).getCFU(corso));
                
                request.setAttribute("libri_testo", corso.getLibriTestoCorso());
                request.setAttribute("corsi_propedeutici", corso.getCorsiPropedeuticiCorso());
                request.setAttribute("corsi_mutuati", corso.getCorsiMutuatiCorso());
                request.setAttribute("corsi_integrati", corso.getCorsiIntegratiCorso());
                request.setAttribute("corso_materiali", corso.getMaterialiCorso());
                
                result.activate("/ita/course.html.ftl", request, response);
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
            
        } catch(DataLayerException e){
            e.printStackTrace();
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
                               
                request.setAttribute("page", "course");
                request.setAttribute("id", request.getParameter("id"));
                
                action_default(request, response); 
                
                
            } catch(TemplateManagerException ex){
                request.setAttribute("exception", ex);
                action_error(request, response);
            }
            
        }
        
    }
    
    @Override
    public String getServletInfo() {
        return "Course servlet";

    }
   
}
