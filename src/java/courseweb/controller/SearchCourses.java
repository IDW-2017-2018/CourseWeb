/*
 * Classe controller SearchCourses
 */
package courseweb.controller;

import courseweb.utils.CorsoComparatorByNome;
import courseweb.data.model.Corso;
import courseweb.data.model.Corso_Laurea;
import courseweb.data.model.CourseWebDataLayer;
import courseweb.data.model.Utente;
import courseweb.utils.Corso_LaureaComparatorByNome;
import courseweb.utils.UtenteComparatorByCognome;
import framework.result.FailureResult;
import framework.result.TemplateManagerException;
import framework.result.TemplateResult;
import framework.security.SecurityLayer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import framework.data.DataLayerException; 
import java.io.IOException;
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
        
            List<Corso> corsi_non_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsiAggiornati(); 
            
            List<Corso> corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filterCorsiByLang("ita", corsi_non_filtrati); 
            
            CourseWebDataLayer datalayer = (CourseWebDataLayer) request.getAttribute("datalayer");
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                
                corsi_filtrati.sort(new CorsoComparatorByNome());
                request.setAttribute("corsi", corsi_filtrati);
   
                List<Utente> docenti = datalayer.getDocenti();
                docenti.sort(new UtenteComparatorByCognome());
                
                List<Corso_Laurea> corsi_laurea = datalayer.getCorsiLaurea();
                corsi_laurea.sort(new Corso_LaureaComparatorByNome());
                
                request.setAttribute("docenti", docenti);
                request.setAttribute("corsilaurea", corsi_laurea);
                result.activate("/eng/search_courses.html.ftl", request, response);  

            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                
                corsi_filtrati.sort(new CorsoComparatorByNome());
                request.setAttribute("corsi", corsi_filtrati);
   
                List<Utente> docenti = datalayer.getDocenti();
                docenti.sort(new UtenteComparatorByCognome());
                
                List<Corso_Laurea> corsi_laurea = datalayer.getCorsiLaurea();
                corsi_laurea.sort(new Corso_LaureaComparatorByNome());
                
                request.setAttribute("docenti", datalayer.getDocenti());
                request.setAttribute("corsilaurea", datalayer.getCorsiLaurea());                
                result.activate("/ita/search_courses.html.ftl", request, response); 

            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response);

            }
            
        } catch(DataLayerException e){
            request.setAttribute("exception", e); 
            action_error(request, response);
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
        String corso_semestre = request.getParameter("corso_semestre");
        String corso_docente = request.getParameter("corso_docente");
        String corso_lingua = request.getParameter("corso_lingua");
        String corso_corsi_laurea = request.getParameter("corso_corsi_laurea");
        //ricaricare la pagina con la nuova List di corsi
                  
        try {
                                
            if(!corso_nome.equals("")){
                corsi_non_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsiByNomeAggiornati(corso_nome); 
            }
            else {
                corsi_non_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsiAggiornati();
            }
                                             
            corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filterCorsiByLang("ita", corsi_non_filtrati); 
            // abbiamo lista dei corsi aggiornati e filtrati in base alla lingua e al nome, se è stato inserito
            
            // codice , SSD , semestre , docente , lingua , corsi di laurea
                                   
            if (!corso_codice.equals("")){
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraCorsi(corsi_filtrati, "corso_codice", corso_codice); 
            } 
            
            if (!corso_ssd.equals("")){
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraCorsi(corsi_filtrati, "corso_ssd", corso_ssd); 
            } 
            
            if (!corso_semestre.equals("---")){
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraCorsi(corsi_filtrati, "corso_semestre", corso_semestre); 
            } 
            
            if (!corso_docente.equals("---")){
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraCorsi(corsi_filtrati, "corso_docente", corso_docente); 
            } 
            
            if (!corso_lingua.equals("---")){
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraCorsi(corsi_filtrati, "corso_lingua", corso_lingua); 
            } 
            
            if (!corso_corsi_laurea.equals("---")){
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraCorsi(corsi_filtrati, "corso_corsi_laurea", corso_corsi_laurea); 
            } 
            
        TemplateResult result = new TemplateResult(getServletContext());
        CourseWebDataLayer datalayer = (CourseWebDataLayer) request.getAttribute("datalayer");
        //carica la pagina
        if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                corsi_filtrati.sort(new CorsoComparatorByNome());
                request.setAttribute("corsi", corsi_filtrati);
                
                List<Utente> docenti = datalayer.getDocenti();
                docenti.sort(new UtenteComparatorByCognome());
                
                List<Corso_Laurea> corsi_laurea = datalayer.getCorsiLaurea();
                corsi_laurea.sort(new Corso_LaureaComparatorByNome());
                
                request.setAttribute("docenti", datalayer.getDocenti());
                request.setAttribute("corsilaurea", datalayer.getCorsiLaurea());                
                result.activate("/eng/search_courses.html.ftl", request, response);  

            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                corsi_filtrati.sort(new CorsoComparatorByNome());
                request.setAttribute("corsi", corsi_filtrati);
                
                List<Utente> docenti = datalayer.getDocenti();
                docenti.sort(new UtenteComparatorByCognome());
                
                List<Corso_Laurea> corsi_laurea = datalayer.getCorsiLaurea();
                corsi_laurea.sort(new Corso_LaureaComparatorByNome());
                
                request.setAttribute("docenti", datalayer.getDocenti());
                request.setAttribute("corsilaurea", datalayer.getCorsiLaurea());                
                result.activate("/ita/search_courses.html.ftl", request, response); 

            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response);

            }
            
        }
        catch(DataLayerException exc){
            request.setAttribute("exception", exc); 
            action_error(request, response);
            exc.printStackTrace();
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
                               
                request.setAttribute("page", "searchcourses");
                request.setAttribute("style", "searchcourses");
                
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
