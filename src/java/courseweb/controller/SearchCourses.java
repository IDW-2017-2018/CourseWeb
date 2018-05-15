/*
 * Classe controller SearchCourses
 */
package courseweb.controller;

import courseweb.data.model.Corso;
import courseweb.data.model.CourseWebDataLayer;
import framework.result.FailureResult;
import framework.result.TemplateManagerException;
import framework.result.TemplateResult;
import framework.security.SecurityLayer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import framework.data.DataLayerException; 
import java.util.ArrayList;
import java.util.List;

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
        
        try {
        
            String lang = (String) request.getAttribute("lang"); 
            List<Corso> corsi_non_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsiAggiornati(); 
            List<Corso> corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filterCorsiByLang(lang, corsi_non_filtrati); 
                   
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                request.setAttribute("corsi", corsi_filtrati);
                result.activate("/eng/search_courses.html.ftl", request, response);  

            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                request.setAttribute("corsi", corsi_filtrati);
                result.activate("/ita/search_courses.html.ftl", request, response); 

            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response);

            }
            
        } catch(DataLayerException e){
            e.printStackTrace();
        }
         
    }
    
    //Azione compiuta al filtraggio della ricerca
    private void action_filter(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException, ServletException {
        List<Corso> corsi_non_filtrati = new ArrayList();
        List<Corso> corsi_filtrati = new ArrayList();
        //request.getParameter() per ogni parametro filtro
        String corso_nome = request.getParameter("corso_nome");
        String corso_codice = request.getParameter("corso_codice");
        String corso_ssd = request.getParameter("corso_ssd");
        int corso_semestre = Integer.parseInt(request.getParameter("corso_semestre"));
        String corso_docente = request.getParameter("corso_docente");
        String corso_lingua = request.getParameter("corso_lingua");
        String corso_corsi_laurea = request.getParameter("corso_corsi_laurea");
        //ricaricare la pagina con la nuova List di corsi
        
        try {
            String lang = (String) request.getAttribute("lang");
            
            if(corso_nome != null){
            corsi_non_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsiByNomeAggiornati(corso_nome); 
            }
            else {
            corsi_non_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsiAggiornati();
            }
            corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filterCorsiByLang(lang, corsi_non_filtrati); 
            // abbiamo lista dei corsi aggiornati e filtrati in base alla lingua e al nome, se è stato inserito
            
            // codice , SSD , semestre , docente , lingua , corsi di laurea
            /*
            if (corso_codice != null){
                corsi_filtrati = 
            }
            */
            
           
        }
        catch(DataLayerException exc){
            exc.printStackTrace();
        }
        
        TemplateResult result = new TemplateResult(getServletContext());
        
        
        //carica la pagina
        if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                //request.setAttribute("corsi", corsi_filtrati);
                result.activate("/eng/search_courses.html.ftl", request, response);  

            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                //request.setAttribute("corsi", corsi_filtrati);
                result.activate("/ita/search_courses.html.ftl", request, response); 

            } else {
                request.setAttribute("message", "Illegal language");
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
                               
                request.setAttribute("page", "searchcourses");
                
                if(request.getParameter("filtra") != null){
                    action_filter(request, response); 
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