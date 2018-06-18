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
public interface Corso extends Comparable<Corso> {
    
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
    String getDescrittoriDublino();
    
    String getLang();
    
    List<Utente> getDocentiCorso() throws DataLayerException;
    List<Corso_Laurea> getCorsiLaureaCorso() throws DataLayerException;
    List<Corso> getCorsiPropedeuticiCorso() throws DataLayerException;       
    List<Corso> getCorsiMutuatiCorso() throws DataLayerException;            
    List<Corso> getModuliCorso() throws DataLayerException; 
    List<Materiale> getMaterialiCorso() throws DataLayerException;   
    List<Libro_Testo> getLibriTestoCorso() throws DataLayerException;
    
    
    void setId(int id);
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
    void setLinkHomepageCorso(String link_homepage_corso);
    void setLinkRisorseEsterne(String link_risorse_esterne);
    void setLinkForum(String link_forum);
    void setAnno(String anno);
    void setNote(String note);
    void setDescrittoriDublino(String descrittori_dublino);
    void setDocenti(List<Utente> docenti);
    void setCorsiLaurea(List<Corso_Laurea> corsi_laurea);
    void setLibriTesto(List<Libro_Testo> libri_testo);
    void setCorsiPropedeutici(List<Corso> corsi_propedeutici);       
    void setCorsiMutuati(List<Corso> corsi_mutuati);            
    void setModuliCorso(List<Corso> moduli); 
    void setMateriali(List<Materiale> materiali);
    
    void setLang(String lang); 
    
    void copyFrom(Corso corso) throws DataLayerException;
    void setDirty(boolean dirty); 
    boolean isDirty();   
    
    boolean isFilled();
}
