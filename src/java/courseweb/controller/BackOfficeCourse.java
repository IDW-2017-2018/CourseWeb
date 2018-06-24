/*
 * Class BackOfficeCourse
 */
package courseweb.controller;

import courseweb.utils.CorsoComparatorByNome;
import courseweb.data.impl.CorsoImpl;
import courseweb.data.model.Corso;
import courseweb.data.model.Corso_Laurea;
import courseweb.data.model.CourseWebDataLayer;
import courseweb.data.model.Utente;
import courseweb.utils.Corso_LaureaComparatorByNome;
import courseweb.utils.UtenteComparatorByCognome;
import framework.data.DataLayerException;
import framework.result.FailureResult;
import framework.result.TemplateManagerException;
import framework.result.TemplateResult;
import framework.security.SecurityLayer;
import java.io.IOException;
import java.time.Year;
import java.util.ArrayList;
import java.util.List;
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
            boolean primoanno = false;
            String codice = request.getParameter("corso_codice");
            int year = Year.now().getValue();
            String anno = (year-1) + "/" + year;
            String nome = request.getParameter("corso_nome");
            String ssd = request.getParameter("corso_ssd");
            int semestre = Integer.parseInt(request.getParameter("corso_semestre"));
            String lingua = request.getParameter("corso_lingua");
            int docente = Integer.parseInt(request.getParameter("corso_docente"));
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

            prerequisitiEng = SecurityLayer.addSlashes(prerequisitiEng);
            obiettiviEng = SecurityLayer.addSlashes(obiettiviEng);
            modEsameEng = SecurityLayer.addSlashes(modEsameEng);
            modInsegnamentoEng = SecurityLayer.addSlashes(modInsegnamentoEng);
            descrittoriDublinoEng = SecurityLayer.addSlashes(descrittoriDublinoEng);
            sillaboEng = SecurityLayer.addSlashes(sillaboEng);
            noteEng = SecurityLayer.addSlashes(noteEng);
           
            linkHomepage = linkHomepage.trim();
            linkRisorse = linkRisorse.trim();
            linkForum = linkForum.trim();
            
            prerequisitiEng = prerequisitiEng.trim();
            obiettiviEng = obiettiviEng.trim();
            modEsameEng = modEsameEng.trim();
            modInsegnamentoEng = modInsegnamentoEng.trim();
            descrittoriDublinoEng = descrittoriDublinoEng.trim();
            sillaboEng = sillaboEng.trim();
            noteEng = noteEng.trim();
            
            prerequisiti = prerequisiti.trim();
            obiettivi = obiettivi.trim();
            modEsame = modEsame.trim();
            modInsegnamento = modInsegnamento.trim();
            descrittoriDublino = descrittoriDublino.trim();
            sillabo = sillabo.trim();
            note = note.trim();            
                       
            CourseWebDataLayer datalayer = ((CourseWebDataLayer) request.getAttribute("datalayer"));
            List<Corso> corso_versioni = datalayer.getCorsoByNomeVersioni(nome);
            for(Corso corso:corso_versioni){
                if(corso.getAnno().equals(anno)){
                request.setAttribute("message", "course for the chosen year already exists");
                action_error(request, response);
                return;   
                }
            }           
            Corso corso = new CorsoImpl(datalayer);
            corso.setCodice(codice);
            corso.setAnno(anno);
            corso.setNome(nome);
            corso.setSSD(ssd);
            corso.setSemestre(semestre);
            corso.setLingua(lingua);
            List<Corso> updated = datalayer.getCorsiByNomeAggiornati(nome);
            List<Corso> aggiornato = datalayer.getCorsiByNomeAggiornati(nome);
            if(aggiornato.isEmpty()) primoanno = true;
            
            if(linkHomepage.equals("") && linkRisorse.equals("") && linkForum.equals("") && !updated.isEmpty()){
                corso.setLinkHomepageCorso(updated.get(0).getLinkHomepageCorso());
                corso.setLinkRisorseEsterne(updated.get(0).getLinkRisorseEsterne());
                corso.setLinkForum(updated.get(0).getLinkForum());
            } else {
            corso.setLinkHomepageCorso(linkHomepage);
            corso.setLinkRisorseEsterne(linkRisorse);
            corso.setLinkForum(linkForum);
            }
            datalayer.storeCorso(corso);
            datalayer.storeCorsiDocenti(corso.getId(), docente);
            
            if(primoanno){
                if (((prerequisiti.equals("")) && (obiettivi.equals("")) && (modEsame.equals("")) && 
               (modInsegnamento.equals("")) && (sillabo.equals("")) && (note.equals("")) &&
               (descrittoriDublino.equals("")) && (prerequisitiEng.equals("")) && (obiettiviEng.equals("")) && 
               (modEsameEng.equals("")) && (modInsegnamentoEng.equals("")) && (descrittoriDublinoEng.equals("")) && 
               (sillaboEng.equals("")) && (noteEng.equals("")))){
                   request.setAttribute("message","no older version of this course exists: empty fields forbidden");
                   action_error(request,response);
                   return;
                }else{
                corso.setPrerequisiti(prerequisiti);
                corso.setObiettivi(obiettivi);
                corso.setModEsame(modEsame);
                corso.setModInsegnamento(modInsegnamento);
                corso.setDescrittoriDublino(descrittoriDublino);
                corso.setSillabo(sillabo);
                corso.setNote(note);
                corso.setLang("ita");                
                datalayer.storeInfoCorso(corso);                

                corso.setPrerequisiti(prerequisitiEng);
                corso.setObiettivi(obiettiviEng);
                corso.setModEsame(modEsameEng);
                corso.setModInsegnamento(modInsegnamentoEng);
                corso.setDescrittoriDublino(descrittoriDublinoEng);
                corso.setSillabo(sillaboEng);
                corso.setNote(noteEng);
                corso.setLang("eng");                
                datalayer.storeInfoCorso(corso);                                    
                }
            }else{
                if(((prerequisiti.equals("")) && (obiettivi.equals("")) && (modEsame.equals("")) && 
               (modInsegnamento.equals("")) && (sillabo.equals("")) && (note.equals("")) &&
               (descrittoriDublino.equals("")) && (prerequisitiEng.equals("")) && (obiettiviEng.equals("")) && 
               (modEsameEng.equals("")) && (modInsegnamentoEng.equals("")) && (descrittoriDublinoEng.equals("")) && 
               (sillaboEng.equals("")) && (noteEng.equals("")))){
                corso.setPrerequisiti(aggiornato.get(0).getPrerequisiti());
                corso.setObiettivi(aggiornato.get(0).getObiettivi());
                corso.setModEsame(aggiornato.get(0).getModEsame());
                corso.setModInsegnamento(aggiornato.get(0).getModInsegnamento());
                corso.setDescrittoriDublino(aggiornato.get(0).getDescrittoriDublino());
                corso.setSillabo(aggiornato.get(0).getSillabo());
                corso.setNote(aggiornato.get(0).getNote());
                corso.setLang(aggiornato.get(0).getLang());
                datalayer.storeInfoCorso(corso);
                
                corso.setPrerequisiti(aggiornato.get(1).getPrerequisiti());
                corso.setObiettivi(aggiornato.get(1).getObiettivi());
                corso.setModEsame(aggiornato.get(1).getModEsame());
                corso.setModInsegnamento(aggiornato.get(1).getModInsegnamento());
                corso.setDescrittoriDublino(aggiornato.get(1).getDescrittoriDublino());
                corso.setSillabo(aggiornato.get(1).getSillabo());
                corso.setNote(aggiornato.get(1).getNote());
                corso.setLang(aggiornato.get(1).getLang());
                datalayer.storeInfoCorso(corso);                              
                }else{
                corso.setPrerequisiti(prerequisiti);
                corso.setObiettivi(obiettivi);
                corso.setModEsame(modEsame);
                corso.setModInsegnamento(modInsegnamento);
                corso.setDescrittoriDublino(descrittoriDublino);
                corso.setSillabo(sillabo);
                corso.setNote(note);
                corso.setLang("ita");                
                datalayer.storeInfoCorso(corso);                

                corso.setPrerequisiti(prerequisitiEng);
                corso.setObiettivi(obiettiviEng);
                corso.setModEsame(modEsameEng);
                corso.setModInsegnamento(modInsegnamentoEng);
                corso.setDescrittoriDublino(descrittoriDublinoEng);
                corso.setSillabo(sillaboEng);
                corso.setNote(noteEng);
                corso.setLang("eng");                
                datalayer.storeInfoCorso(corso);                                                  
                }
            }    
            
            datalayer.storeLogMessage("L'utente " + ((Utente)((HttpSession) request.getAttribute("session")).getAttribute("utente")).getEmail() + " ha aggiunto il corso " + nome);
            datalayer.storeLogMessage("L'utente " + ((Utente)((HttpSession) request.getAttribute("session")).getAttribute("utente")).getEmail() + " ha aggiunto un docente al corso " + nome);
            response.sendRedirect(response.encodeURL(request.getContextPath() + "/backofficehub?lang=" + request.getAttribute("lang")));
                        
        }
        catch(DataLayerException|IOException e){
            request.setAttribute("exception", e);
            action_error(request, response);
        }
    }
    
    private void action_aggiungi_corso_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
        if(request.getAttribute("session") != null){
            HttpSession session = (HttpSession) request.getAttribute("session");
            if(((Utente)session.getAttribute("utente")).getTipoUtente().equals("docente")){
                request.setAttribute("message", "not permitted");
                action_error(request, response);
                return;
            }
        }
        try{
            List<Utente> docenti = ((CourseWebDataLayer) request.getAttribute("datalayer")).getDocenti();
            docenti.sort(new UtenteComparatorByCognome());
            int year = Year.now().getValue();
            String anno = (year-1) + "/" + year;
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                request.setAttribute("anno", anno);
                request.setAttribute("docenti", docenti);
                result.activate("/eng/backoffice_add_course.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                request.setAttribute("anno", anno);
                request.setAttribute("docenti", docenti);
                result.activate("/ita/backoffice_add_course.html.ftl", request, response);
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
              
    } catch (DataLayerException e){
        request.setAttribute("exception",e);
        action_error(request, response);
    }
    }
    
    private void action_filter_modifica_corso_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        TemplateResult result = new TemplateResult(getServletContext()); 
        
        try {            
            CourseWebDataLayer datalayer = (CourseWebDataLayer)request.getAttribute("datalayer");
            List<Corso> corsi_filtrati = null;
            List<Corso> corsi_non_filtrati = datalayer.getCorsi();      
            String lang = (String) request.getAttribute("lang"); 
            HttpSession session = (HttpSession) request.getAttribute("session");
            if(request.getAttribute("session") != null){
                if(((Utente)session.getAttribute("utente")).getTipoUtente().equals("docente")){
                corsi_non_filtrati = datalayer.getCorsiAggiornati();    
                String cognome = ((Utente)session.getAttribute("utente")).getCognome();
                corsi_filtrati = datalayer.filtraCorsi(corsi_non_filtrati, "corso_docente", cognome);
                corsi_filtrati = datalayer.filterCorsiByLang(lang, corsi_filtrati);
                }
            else{
                corsi_filtrati = datalayer.filterCorsiByLang(lang, corsi_non_filtrati);
                }
            }    
            List<Corso_Laurea> corsilaurea = datalayer.getCorsiLaurea();
            List<Utente> docenti = datalayer.getDocenti();
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                corsi_filtrati.sort(new CorsoComparatorByNome());
                request.setAttribute("corsi", corsi_filtrati);
                
                corsilaurea.sort(new Corso_LaureaComparatorByNome());
                request.setAttribute("corsilaurea", corsilaurea);
                
                docenti.sort(new UtenteComparatorByCognome());
                request.setAttribute("docenti", docenti);
                
                result.activate("/eng/backoffice_filter_edit_course.html.ftl", request, response);
            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                corsi_filtrati.sort(new CorsoComparatorByNome());
                request.setAttribute("corsi", corsi_filtrati);
                
                corsilaurea.sort(new Corso_LaureaComparatorByNome());
                request.setAttribute("corsilaurea", corsilaurea);
                
                docenti.sort(new UtenteComparatorByCognome());
                request.setAttribute("docenti", docenti);
                
                result.activate("/ita/backoffice_filter_edit_course.html.ftl", request, response);
            } else {
                request.setAttribute("message", "Illegal language");
                action_error(request, response); 
            }
        }
        catch(DataLayerException e){
            request.setAttribute("exception", e);
            action_error(request,response);
        }
    }        
    private void action_filter_modifica_corso(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
       List<Corso> corsi_non_filtrati = new ArrayList();
       List<Corso> corsi_filtrati = new ArrayList();
       //request.getParameter() per ogni parametro filtro
       String corso_nome = request.getParameter("corso_nome");
       String corso_codice = request.getParameter("corso_codice");
       String corso_ssd = request.getParameter("corso_ssd");
       String corso_docente = request.getParameter("corso_docente");
       String corso_lingua = request.getParameter("corso_lingua");
       String corso_corsi_laurea = request.getParameter("corso_corsi_laurea");
       try {
           String lang = (String) request.getAttribute("lang");                               
           if(!corso_nome.equals("")){
                corsi_non_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsoByNome(corso_nome);
           }else{
                corsi_non_filtrati=((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsi();
                }
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filterCorsiByLang(lang, corsi_non_filtrati);        
                                                  
            if (!corso_codice.equals("")){
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraCorsi(corsi_filtrati, "corso_codice", corso_codice); 
            } 
            
            if (!corso_ssd.equals("")){
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraCorsi(corsi_filtrati, "corso_ssd", corso_ssd); 
            } 
            
            if (!corso_docente.equals("---")){
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraCorsi(corsi_filtrati, "corso_docente", ((CourseWebDataLayer) request.getAttribute("datalayer")).getUtente(Integer.parseInt(corso_docente)).getCognome());
            } 
            
            if (!corso_lingua.equals("---")){
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraCorsi(corsi_filtrati, "corso_lingua", corso_lingua); 
            } 
            
            if (!corso_corsi_laurea.equals("---")){
                corsi_filtrati = ((CourseWebDataLayer) request.getAttribute("datalayer")).filtraCorsi(corsi_filtrati, "corso_corsi_laurea", corso_corsi_laurea); 
            } 
            TemplateResult result = new TemplateResult(getServletContext());
            List<Corso_Laurea> corsilaurea = ((CourseWebDataLayer) request.getAttribute("datalayer")).getCorsiLaurea();
            List<Utente> docenti = ((CourseWebDataLayer) request.getAttribute("datalayer")).getDocenti();
            //carica la pagina
            if(request.getAttribute("lang").equals("eng")){
                request.setAttribute("navbar_tpl", "/eng/logged_navbar.html.ftl");
                corsi_filtrati.sort(new CorsoComparatorByNome());
                request.setAttribute("corsi", corsi_filtrati);
                
                corsilaurea.sort(new Corso_LaureaComparatorByNome());
                request.setAttribute("corsilaurea", corsilaurea);
                
                docenti.sort(new UtenteComparatorByCognome());
                request.setAttribute("docenti", docenti);
                result.activate("/eng/backoffice_filter_edit_course.html.ftl", request, response);  

            } else if(request.getAttribute("lang").equals("ita")){
                request.setAttribute("navbar_tpl", "/ita/logged_navbar.html.ftl");
                corsi_filtrati.sort(new CorsoComparatorByNome());
                request.setAttribute("corsi", corsi_filtrati);
                
                corsilaurea.sort(new Corso_LaureaComparatorByNome());
                request.setAttribute("corsilaurea", corsilaurea);
                
                docenti.sort(new UtenteComparatorByCognome());
                request.setAttribute("docenti", docenti);
                result.activate("/ita/backoffice_filter_edit_course.html.ftl", request, response); 

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

    private void action_modifica_corso_default(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
                
        HttpSession session = (HttpSession) request.getAttribute("session"); 
        session.setAttribute("lang", request.getAttribute("lang"));                            
        request.setAttribute("session", session); 
        
        
        try {
            if(request.getParameter("id") == null){
            request.setAttribute("message","not a valid corso id");
            action_error(request,response);
            return;
            }
            int id = Integer.parseInt(request.getParameter("id"));
            response.sendRedirect(response.encodeURL(request.getContextPath() + "/backofficeeditcourse?lang=" + request.getAttribute("lang") + "&id=" + id + "&action=hub"));
            
        } catch(IOException e){
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
                               
                request.setAttribute("style", "backoffice");
                request.setAttribute("page", "backofficecourse");
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
                  
                if(action.equals("add_course") && (request.getParameter("aggiungi_corso") != null)){
                  action_aggiungi_corso(request,response);  
                }
                else if(action.equals("add_course") && !(request.getParameter("aggiungi_corso") != null)){
                  action_aggiungi_corso_default(request,response);
                }
                else if(action.equals("edit_course") && !(request.getParameter("filtra") != null) && !(request.getParameter("id") != null)){
                  action_filter_modifica_corso_default(request,response);  
                }
                else if(action.equals("edit_course") && (request.getParameter("filtra") != null) && !(request.getParameter("id") != null)){
                  action_filter_modifica_corso(request,response);
                }
                else if(action.equals("edit_course") && !(request.getParameter("filtra") != null) && (request.getParameter("id") != null)){
                  action_modifica_corso_default(request,response);
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
