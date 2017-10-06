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
    List<Materiale> getMateriali() throws DataLayerException;       //lista materiale creare interfaccia e implementazione
    
    
    
    void setNome(String nome);
    void setCodice(String codice);
    void setSSD(String ssd);
    void setSemestre(int semestre);
    void setLingua(String lingua);
    
    void setDirty(boolean dirty); 
    boolean isDirty();    
}
