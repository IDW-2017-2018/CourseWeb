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
    List<Utente> getDocenti() throws DataLayerException;
    List<Corso_Laurea> getCorsiLaurea() throws DataLayerException;      //aggiungere campo CFU e TipologiaCFU
    
    //campi non ancora creati nel db e nell'implementazione
    String getPrerequisiti();
    String getObiettivi();      //può essere strutturato con i descrittori di dublino
    String getModEsame();
    String getModInsegnamento();
    String getSillabo();
    List<LibroTesto> getLibriTesto() throws DataLayerException;
    List<Corso> getCorsiPropedeutici() throws DataLayerException;       //propedeuticità
    List<Corso> getCorsiMutuati() throws DataLayerException;            //sostituzione
    List<Corso> getCorsiIntegrati() throws DataLayerException;          //moduli
    String getLinkHomepageCorso();
    String getLinkRisorseEsterne();
    String getLinkForum();
    String getNote();
    List<Materiale> getMateriali() throws DataLayerException;       //lista materiale creare interfaccia e implementazione
    String getAnno();       //da vedere come inserirlo nel database, renderlo chiave
    
    
    void setNome(String nome);
    void setCodice(String codice);
    void setSSD(String ssd);
    void setSemestre(int semestre);
    void setLingua(String lingua);
    
    void setDirty(boolean dirty); 
    boolean isDirty();    
}
