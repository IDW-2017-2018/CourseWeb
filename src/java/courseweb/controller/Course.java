/*
 * Classe Course
 */
package courseweb.controller;

import courseweb.data.model.Corso;
import courseweb.data.model.CourseWebDataLayer;
import courseweb.data.model.Materiale;
import courseweb.utils.CorsoComparatorByDateDesc;
import framework.data.DataLayerException;
import framework.result.FailureResult;
import framework.result.StreamResult;
import framework.result.TemplateManagerException;
import framework.result.TemplateResult;
import framework.security.SecurityLayer;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
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
            Corso corso_ita = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorso(Integer.parseInt(id_corso), "ita");
            Corso corso_eng = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorso(Integer.parseInt(id_corso), "eng");
            Corso corso; 
            
            boolean corso_ita_is_filled = corso_ita.isFilled();
            boolean corso_eng_is_filled = corso_eng.isFilled();
                    
            //in base a lingua scelta corso visualizzato in italiano o in inglese considerando anche la vuotezza dell'oggetto
            if(corso_ita_is_filled && request.getAttribute("lang").equals("ita"))
                corso = corso_ita;
            else if((!corso_ita_is_filled) && request.getAttribute("lang").equals("ita"))
                corso = corso_eng;
            else if(corso_eng_is_filled && request.getAttribute("lang").equals("eng"))
                corso = corso_eng;
            else if((!corso_eng_is_filled) && request.getAttribute("lang").equals("eng"))
                corso = corso_ita;
            else 
                corso = corso_eng;
            
            
            
            if(request.getAttribute("lang").equals("eng")){
                
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
             
                request.setAttribute("corso", corso);               
                List<Corso> VersioniCorsoSecondoLingua = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsoByNomeVersioni(corso.getNome());
                List<Corso> corsi = ((CourseWebDataLayer) request.getAttribute("datalayer")).filterCorsiByLang(corso.getLang(), VersioniCorsoSecondoLingua);
                corsi.sort(new CorsoComparatorByDateDesc());
                request.setAttribute("corso_anni", corsi);                
                request.setAttribute("docenti", corso.getDocentiCorso());               
                request.setAttribute("corsi_laurea", ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsiLaureaANDCFU(corso));                
                request.setAttribute("libri_testo", corso.getLibriTestoCorso());
                request.setAttribute("corsi_propedeutici", corso.getCorsiPropedeuticiCorso());
                request.setAttribute("corsi_mutuati", corso.getCorsiMutuatiCorso());
                request.setAttribute("moduli", corso.getModuliCorso());
                request.setAttribute("corso_materiali", corso.getMaterialiCorso());
                
                result.activate("/eng/course.html.ftl", request, response);
                
            } else if(request.getAttribute("lang").equals("ita")){
                
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                
                request.setAttribute("corso", corso);               
                List<Corso> VersioniCorsoSecondoLingua = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsoByNomeVersioni(corso.getNome());
                List<Corso> corsi = ((CourseWebDataLayer) request.getAttribute("datalayer")).filterCorsiByLang(corso.getLang(), VersioniCorsoSecondoLingua);
                corsi.sort(new CorsoComparatorByDateDesc());
                request.setAttribute("corso_anni", corsi);               
                request.setAttribute("docenti", corso.getDocentiCorso());               
                request.setAttribute("corsi_laurea", ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsiLaureaANDCFU(corso));               
                request.setAttribute("libri_testo", corso.getLibriTestoCorso());
                request.setAttribute("corsi_propedeutici", corso.getCorsiPropedeuticiCorso());
                request.setAttribute("corsi_mutuati", corso.getCorsiMutuatiCorso());
                request.setAttribute("moduli", corso.getModuliCorso());
                request.setAttribute("corso_materiali", corso.getMaterialiCorso());
                
                result.activate("/ita/course.html.ftl", request, response);
                
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
            
        } catch(DataLayerException|NumberFormatException e){
            request.setAttribute("exception", e); 
            action_error(request, response);
            e.printStackTrace();
        }
        
        
        
    }
    
    private void action_download(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        try {
            
            if(request.getParameter("materiale_id") == null) {
                request.setAttribute("message","not a valid materiale id");
                action_error(request,response);
                return;
            }
            
            int materiale_id = Integer.parseInt(request.getParameter("materiale_id"));  
            
            StreamResult result = new StreamResult(getServletContext());
            CourseWebDataLayer datalayer = (CourseWebDataLayer) request.getAttribute("datalayer");
           
            Materiale materiale = datalayer.getMateriale(materiale_id);
            
            try (InputStream is = new FileInputStream(getServletContext().getInitParameter("uploads.directory") + File.separatorChar + materiale.getPercorso())){
                
                String ext = "";
                int i = materiale.getPercorso().lastIndexOf('.');
                if (i >= 0) {
                    ext = materiale.getPercorso().substring(i+1);
                }
                
                request.setAttribute("contentType", (ext.equals("")) ? null : ext);
                result.activate(is, materiale.getDimensione(), materiale.getNome() + "." + ext, request, response);
            }
            
        } catch(IOException|DataLayerException e){
            e.printStackTrace();
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
                               
                request.setAttribute("page", "course");
                request.setAttribute("style", "course");
                request.setAttribute("id", request.getParameter("id"));
                
                if(request.getParameter("download") != null){
                    action_download(request, response);
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
        return "Course servlet";

    }
   
}
