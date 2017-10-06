/*
 * Interfaccia Corso
 */
package courseweb.data.model;

import framework.data.DataLayerException;
import java.util.List;

/**
 *
 * @author Flavio
 */
public interface Corso {
    
    int getId();
    String getNome();
    String getCodice();
    String getSSD();
    int getSemestre();
    String getLingua(); 
    String getPrerequisiti();
    String getObiettivi();  
    String getModEsame();
    String getModInsegnamento();
    String getSillabo();
    String getLinkHomepageCorso();
    String getLinkRisorseEsterne();
    String getLinkForum();
    String getAnno();       
    String getNote();
    List<Utente> getDocenti() throws DataLayerException;
    List<Corso_Laurea> getCorsiLaurea() throws DataLayerException;
    List<LibroTesto> getLibriTesto() throws DataLayerException;
    List<Corso> getCorsiPropedeutici() throws DataLayerException;       
    List<Corso> getCorsiMutuati() throws DataLayerException;            
    List<Corso> getCorsiIntegrati() throws DataLayerException; 
    List<Materiale> getMateriali() throws DataLayerException;     
    
    
    void setNome(String nome);
    void setCodice(String codice);
    void setSSD(String ssd);
    void setSemestre(int semestre);
    void setLingua(String lingua);
    void setPrerequisiti(String prerequisiti);
    void setObiettivi(String obiettivi);
    void setModEsame(String mod_esame);
    void setModInsegnamento(String insegnamento);
    void setSillabo(String sillabo);
    void setLinkHomePageCorso(String link_homepage_corso);
    void setLinkRisorseEsterne(String link_risorse_esterne);
    void setLinkForum(String link_forum);
    void setAnno(String anno);
    void setNote(String note);   
    void setDocenti(List<Utente> docenti);
    void setCorsiLaurea(List<Corso_Laurea> corsi_laurea);
    void setLibriTesto(List<LibroTesto> libri_testo);
    void setCorsiPropedeutici(List<Corso> corsi_propedeutici);       
    void setCorsiMutuati(List<Corso> corsi_mutuati);            
    void setCorsiIntegrati(List<Corso> corsi_integrati); 
    void setMateriali(List<Materiale> materiali);
    
    void setDirty(boolean dirty); 
    boolean isDirty();    
}
