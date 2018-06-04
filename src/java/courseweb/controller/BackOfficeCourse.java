/*
 * Class BackOfficeCourse
 */
package courseweb.controller;

import courseweb.data.impl.CorsoImpl;
import courseweb.data.model.Corso;
import courseweb.data.model.CourseWebDataLayer;
import courseweb.data.model.Utente;
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
 * @author Flavio
 */
public class BackOfficeCourse extends CourseWebBaseController {
    
    private void action_error(HttpServletRequest request, HttpServletResponse response){
        if(request.getAttribute("exception") != null){
            (new FailureResult(getServletContext())).activate((Exception)request.getAttribute("exception"), request, response);
        } else {
            (new FailureResult(getServletContext())).activate((String)request.getAttribute("message"), request, response);
        }
    }
 
    private void action_aggiungi_corso(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
            
        try{
            String codice = request.getParameter("corso_codice");
            String anno = request.getParameter("corso_anno");
            String nome = request.getParameter("corso_nome");
            String ssd = request.getParameter("corso_ssd");
            int semestre = Integer.parseInt(request.getParameter("corso_semestre"));
            String lingua = request.getParameter("corso_lingua");
            String linkHomepage = request.getParameter("corso_link_homepage");
            String linkRisorse = request.getParameter("corso_link_risorse");
            String linkForum = request.getParameter("corso_link_forum");
            
            String prerequisiti = request.getParameter("corso_prerequisiti");
            String obiettivi = request.getParameter("corso_obiettivi");
            String modEsame = request.getParameter("corso_mod_esame");
            String modInsegnamento = request.getParameter("corso_mod_insegnamento");
            String descrittoriDublino = request.getParameter("corso_descrittori_dublino");
            String sillabo = request.getParameter("corso_sillabo");
            String note = request.getParameter("corso_note");
            
            String prerequisitiEng = request.getParameter("corso_prerequisiti_eng");
            String obiettiviEng = request.getParameter("corso_obiettivi_eng");
            String modEsameEng = request.getParameter("corso_mod_esame_eng");
            String modInsegnamentoEng = request.getParameter("corso_mod_insegnamento_eng");
            String descrittoriDublinoEng = request.getParameter("corso_descrittori_dublino_eng");
            String sillaboEng = request.getParameter("corso_sillabo_eng");
            String noteEng = request.getParameter("corso_note_eng");
            
            
            codice = SecurityLayer.addSlashes(codice);
            anno = SecurityLayer.addSlashes(anno);
            nome = SecurityLayer.addSlashes(nome);
            ssd = SecurityLayer.addSlashes(ssd);
            lingua = SecurityLayer.addSlashes(lingua);
            linkHomepage = SecurityLayer.addSlashes(linkHomepage);
            linkRisorse = SecurityLayer.addSlashes(linkRisorse);
            linkForum = SecurityLayer.addSlashes(linkForum);
            
            prerequisiti = SecurityLayer.addSlashes(prerequisiti);
            obiettivi = SecurityLayer.addSlashes(obiettivi);
            modEsame = SecurityLayer.addSlashes(modEsame);
            modInsegnamento = SecurityLayer.addSlashes(modInsegnamento);
            descrittoriDublino = SecurityLayer.addSlashes(descrittoriDublino);
            sillabo = SecurityLayer.addSlashes(sillabo);
            note = SecurityLayer.addSlashes(note);
            
            prerequisitiEng = SecurityLayer.addSlashes(prerequisitiEng);
            obiettiviEng = SecurityLayer.addSlashes(obiettiviEng);
            modEsameEng = SecurityLayer.addSlashes(modEsameEng);
            modInsegnamentoEng = SecurityLayer.addSlashes(modInsegnamentoEng);
            descrittoriDublinoEng = SecurityLayer.addSlashes(descrittoriDublinoEng);
            sillaboEng = SecurityLayer.addSlashes(sillaboEng);
            noteEng = SecurityLayer.addSlashes(noteEng);
            
            CourseWebDataLayer datalayer = ((CourseWebDataLayer) request.getAttribute("datalayer"));

            Corso corso = new CorsoImpl(datalayer);
            corso.setCodice(codice);
            corso.setAnno(anno);
            corso.setNome(nome);
            corso.setSSD(ssd);
            corso.setSemestre(semestre);
            corso.setLingua(lingua);
            corso.setLinkHomepageCorso(linkHomepage);
            corso.setLinkRisorseEsterne(linkRisorse);
            corso.setLinkForum(linkForum);
                                 
            if(!(prerequisiti.equals("")&&obiettivi.equals("")&&modEsame.equals("")&&modInsegnamento.equals("")&&descrittoriDublino.equals("")&&sillabo.equals("")&&note.equals(""))){
                corso.setPrerequisiti(prerequisiti);
                corso.setObiettivi(obiettivi);
                corso.setModEsame(modEsame);
                corso.setModInsegnamento(modInsegnamento);
                corso.setDescrittoriDublino(descrittoriDublino);
                corso.setSillabo(sillabo);
                corso.setNote(note);
                corso.setLang("ita");
                
                datalayer.storeCorso(corso);
                
            }
            
            if(!(prerequisitiEng.equals("")&&obiettiviEng.equals("")&&modEsameEng.equals("")&&modInsegnamentoEng.equals("")&&descrittoriDublinoEng.equals("")&&sillaboEng.equals("")&&noteEng.equals(""))){
                corso.setPrerequisiti(prerequisitiEng);
                corso.setObiettivi(obiettiviEng);
                corso.setModEsame(modEsameEng);
                corso.setModInsegnamento(modInsegnamentoEng);
                corso.setDescrittoriDublino(descrittoriDublinoEng);
                corso.setSillabo(sillaboEng);
                corso.setNote(noteEng);
                corso.setLang("eng");
                
                datalayer.storeCorso(corso);
                
            }
                        
        }
        catch(DataLayerException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
    }
    
    private void action_aggiungi_corso_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
        
            
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                result.activate("/eng/backoffice_add_course.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                result.activate("/ita/backoffice_add_course.html.ftl", request, response);
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
                               
                request.setAttribute("page", "backoffice");
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
                
                String action = request.getParameter("action"); 
                
                if(action == null){
                    request.setAttribute("message", "Illegal action");
                    action_error(request, response);
                    return;
                }
                
                if(action.equals("add_course") && (request.getParameter("aggiungi_corso") != null)){
                  action_aggiungi_corso(request,response);  
                }
                else if(action.equals("add_course") && !(request.getParameter("aggiungi_corso") != null)){
                  action_aggiungi_corso_default(request,response);
                }
                else if(request.getParameter("hub_modifica_corso") != null){
                  action_aggiungi_corso_default(request,response);
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
        return "BackOfficeCourse servlet";

    }
    
}
