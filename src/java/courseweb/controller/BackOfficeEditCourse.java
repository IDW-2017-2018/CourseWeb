/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package courseweb.controller;

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
public class BackOfficeEditCourse extends CourseWebBaseController {
    
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
            
            if(request.getParameter("id") == null) {
                request.setAttribute("message","not a valid corso id");
                action_error(request,response);
                return;
            }
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                request.setAttribute("id", id); 
                result.activate("/eng/backoffice_edit_course_hub.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                request.setAttribute("id", id); 
                result.activate("/ita/backoffice_edit_course_hub.html.ftl", request, response);
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
            
        } catch(NumberFormatException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
            
    }
    
    /* ACTION ELIMINA */
    private void action_elimina_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
        
        try {
            
            if(request.getParameter("id") == null) {
                request.setAttribute("message","not a valid corso id");
                action_error(request,response);
                return;
            }
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                request.setAttribute("id", id);
                result.activate("/eng/backoffice_delete_course.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                request.setAttribute("id", id);
                result.activate("/ita/backoffice_delete_course.html.ftl", request, response);
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
            
        } catch(NumberFormatException e){
            System.out.println("sono qui exception default"); 
            request.setAttribute("exception", e);
            action_error(request, response);
        }
        
    }
    
    private void action_elimina(HttpServletRequest request, HttpServletResponse response){
        
        try {
            
            if(request.getParameter("id") == null) {
                request.setAttribute("message","not a valid corso id");
                action_error(request,response);
                return;
            }
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            if(request.getParameter("action") == null) {
                request.setAttribute("message","not a valid action");
                action_error(request,response);
                return;
            }
            
            String action = request.getParameter("action");
            
            CourseWebDataLayer datalayer = (CourseWebDataLayer) request.getAttribute("datalayer");
            
            if(action.equals("delete_corso_laurea"))
                if(request.getParameter("item") != null)
                    datalayer.deleteCorsiCorsiLaurea(Integer.parseInt(request.getParameter("item")), id);
                
            else if(action.equals("delete_corso_mutuato"))
                if(request.getParameter("item") != null)
                    datalayer.deleteCorsiCorsiMutuati(Integer.parseInt(request.getParameter("item")), id);
                
            else if(action.equals("delete_corso_integrato"))
                if(request.getParameter("item") != null)
                    datalayer.deleteCorsiModuli(Integer.parseInt(request.getParameter("item")), id);
                
            else if(action.equals("delete_corso_propedeutico"))
                if(request.getParameter("item") != null)
                    datalayer.deleteCorsiCorsiPropedeutici(Integer.parseInt(request.getParameter("item")), id);
                
            else if(action.equals("delete_docente_associato"))
                if(request.getParameter("item") != null)
                    datalayer.deleteCorsiDocenti(Integer.parseInt(request.getParameter("item")), id);
                
            else if(action.equals("delete_corso_libro_testo"))
                if(request.getParameter("item") != null)
                    datalayer.deleteCorsiLibriTesto(Integer.parseInt(request.getParameter("item")), id);
                
            else if(action.equals("delete_corso_materiale"))
                if(request.getParameter("item") != null)
                    datalayer.deleteCorsiMateriali(Integer.parseInt(request.getParameter("item")), id);
            
            
            response.sendRedirect(response.encodeURL(request.getContextPath() + "/backofficeeditcourse?lang=" + request.getAttribute("lang") + "&id=" + id + "&action=hub"));
            
        } catch(DataLayerException|IOException e){
            request.setAttribute("exception", e);
            action_error(request, response); 
        }  
        
    }
    /* END ACTION ELIMINA */
    
    /* ACTION MODIFICA CORSO */
    private void action_modifica_corso_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
         
        try {
            
            if(request.getParameter("id") == null) {
                request.setAttribute("message","not a valid corso id");
                action_error(request,response);
                return;
            }
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                request.setAttribute("corso_ita", ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorso(id, "ita"));
                request.setAttribute("corso_eng", ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorso(id, "eng"));
                result.activate("/eng/backoffice_edit_course.html.ftl", request, response);                
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                request.setAttribute("corso_ita", ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorso(id, "ita"));
                request.setAttribute("corso_eng", ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorso(id, "eng"));
                result.activate("/ita/backoffice_edit_course.html.ftl", request, response);                
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response);                
            }
            
        } catch(DataLayerException|NumberFormatException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
            
        
    }
    
    private void action_modifica_corso(HttpServletRequest request, HttpServletResponse response){
                       
        if(request.getParameter("id") == null) {
            request.setAttribute("message","not a valid corso id");
            action_error(request,response);
            return;
        }
        
        try {
            
            int id = Integer.parseInt(request.getParameter("id")); 
            boolean edited_ita = false; 
            boolean edited_eng = false; 
            
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
            
            Corso corso_ita = datalayer.getCorso(id, "ita");
            Corso corso_eng = datalayer.getCorso(id, "eng");
            
            if(!codice.equals("")){
                corso_ita.setCodice(codice);
                corso_eng.setCodice(codice);
                edited_ita = true;
            }
            
            if(!anno.equals("")){
                corso_ita.setAnno(anno);
                corso_eng.setAnno(anno);
                edited_ita = true;
            }
            
            if(!nome.equals("")){
                corso_ita.setNome(nome);
                corso_eng.setNome(nome);
                edited_ita = true;
            }
            
            if(!ssd.equals("")){
                corso_ita.setSSD(ssd);
                corso_eng.setSSD(ssd);
                edited_ita = true;
            }
            
            if(!lingua.equals("")){
                corso_ita.setLingua(lingua);
                corso_eng.setLingua(lingua);
                edited_ita = true;
            }
            
            if(!linkHomepage.equals("")){
                corso_ita.setLinkHomepageCorso(linkHomepage);
                corso_eng.setLinkHomepageCorso(linkHomepage);
                edited_ita = true;
            }
            
            if(!linkRisorse.equals("")){
                corso_ita.setLinkRisorseEsterne(linkRisorse);
                corso_eng.setLinkRisorseEsterne(linkRisorse);
                edited_ita = true;
            }
            
            if(!linkForum.equals("")){
                corso_ita.setLinkForum(linkForum);
                corso_eng.setLinkRisorseEsterne(linkForum);
                edited_ita = true;
            }
            
            if(!prerequisiti.equals("")){
                corso_ita.setPrerequisiti(prerequisiti);
               
                edited_ita = true;
            }
            
            if(!obiettivi.equals("")){
                corso_ita.setObiettivi(obiettivi);
                
                edited_ita = true;
            }
            
            if(!modEsame.equals("")){
                corso_ita.setModEsame(modEsame);
                
                edited_ita = true;
            }
            
            if(!modInsegnamento.equals("")){
                corso_ita.setModInsegnamento(modInsegnamento);
                
                edited_ita = true;
            }
            
            if(!descrittoriDublino.equals("")){
                corso_ita.setDescrittoriDublino(descrittoriDublino);
                
                edited_ita = true;
            }
            
            if(!sillabo.equals("")){
                corso_ita.setSillabo(sillabo);
                
                edited_ita = true;
            }
            
            if(!note.equals("")){
                corso_ita.setNote(note);
                
                edited_ita = true;
            }
            
            if(!prerequisitiEng.equals("")){
                
                corso_eng.setPrerequisiti(prerequisitiEng);
                edited_eng = true;
            }
            
            if(!obiettiviEng.equals("")){
                
                corso_eng.setObiettivi(obiettiviEng);
                edited_eng = true;
            }
            
            if(!modEsameEng.equals("")){
                
                corso_eng.setModEsame(modEsameEng);
                edited_eng = true;
            }
            
            if(!modInsegnamentoEng.equals("")){
                
                corso_eng.setModInsegnamento(modInsegnamentoEng);
                edited_eng = true;
            }
            
            if(!descrittoriDublinoEng.equals("")){
                
                corso_eng.setDescrittoriDublino(descrittoriDublinoEng);
                edited_eng = true;
            }
            
            if(!sillaboEng.equals("")){
                
                corso_eng.setSillabo(sillaboEng);
                edited_eng = true;
            }
            
            if(!noteEng.equals("")){
                
                corso_eng.setNote(noteEng);
                edited_eng = true;
            }
            
            if(edited_ita)
                datalayer.storeCorso(corso_ita);
            
            if(edited_eng)
                datalayer.storeCorso(corso_eng);
            
            response.sendRedirect(response.encodeURL(request.getContextPath() + "/backofficeeditcourse?lang=" + request.getAttribute("lang") + "&id=" + id + "&action=hub"));
                       
        }
        catch(DataLayerException|NumberFormatException|IOException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
        
    }
    /* END ACTION MODIFICA CORSO */
    
    /* ACTION CORSI LAUREA ASSOCIATI */
    
    private void action_corsi_laurea_associati_aggiungi_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_corsi_laurea_associati_aggiungi(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_corsi_laurea_associati_elimina_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    /* END ACTION CORSI LAUREA ASSOCIATI */
    
    /* ACTION CORSI MUTUATI ASSOCIATI */
    
    private void action_corsi_mutuati_associati_aggiungi_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_corsi_mutuati_associati_aggiungi(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_corsi_mutuati_associati_elimina_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    /* END ACTION CORSI MUTUATI ASSOCIATI */
    
    /* ACTION CORSI PROPEDEUTICI ASSOCIATI */
    
    private void action_corsi_propedeutici_associati_aggiungi_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_corsi_propedeutici_associati_aggiungi(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_corsi_propedeutici_associati_elimina_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    /* END ACTION CORSI PROPEDEUTICI ASSOCIATI */
    
    /* ACTION DOCENTI ASSOCIATI */
    
    private void action_docenti_associati_aggiungi_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_docenti_associati_aggiungi(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_docenti_associati_elimina_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    /* END ACTION DOCENTI ASSOCIATI */
    
    /* ACTION LIBRI TESTO ASSOCIATI */
    
    private void action_libri_testo_associati_aggiungi_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_libri_testo_associati_aggiungi(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_libri_testo_associati_elimina_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    /* END ACTION DOCENTI ASSOCIATI */
    
    /* ACTION MATERIALI ASSOCIATI */
    
    private void action_materiali_associati_aggiungi_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_materiali_associati_aggiungi(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    private void action_materiali_associati_elimina_default(HttpServletRequest request, HttpServletResponse response){
        
    }
    
    /* END ACTION DOCENTI ASSOCIATI */
    
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
                request.setAttribute("page", "backofficeeditcourse");
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
                
                if(action.equals("edit_course") && !(request.getParameter("modifica_corso_action") != null) && (request.getParameter("id") != null)){
                    action_modifica_corso_default(request,response);  
                }
                else if(action.equals("edit_course") && (request.getParameter("modifica_corso_action") != null) && (request.getParameter("id") != null)){                    
                    action_modifica_corso(request,response);  
                }
                else if(action.equals("hub") && (request.getParameter("id") != null)){
                    action_default(request, response);                    
                }
                else {
                    request.setAttribute("message", "Illegal action -- else");
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
        return "BackOfficeEditCourse servlet";

    }
}
