/*
 * Interfaccia CourseWebDataLayer
 */
package courseweb.data.model;

import framework.data.DataLayer;
import framework.data.DataLayerException;
import java.util.List;

/**
 *
 * @author Flavio
 */
public interface CourseWebDataLayer extends DataLayer {
    
    Utente createUtente();
    Corso createCorso();
    Corso_Laurea createCorsoLaurea();
    Libro_Testo createLibroTesto();
    Materiale createMateriale();
    
    Utente getUtente(int utente_key) throws DataLayerException; 
    Utente getUtente(String utente_email) throws DataLayerException; 
    List<Utente> getUtenti() throws DataLayerException;
    
    Utente getDocente(int docente_key) throws DataLayerException; 
    Utente getDocente(String docente_email) throws DataLayerException; 
    List<Utente> getDocenti() throws DataLayerException;
    
    /* Siamo arrivati qui */
    
    List<Corso> getCorsi() throws DataLayerException;
    List<Corso> getCorsiPropedeutici() throws DataLayerException;
    List<Corso> getCorsiMutuati() throws DataLayerException;
    List<Corso> getCorsiIntegrati() throws DataLayerException;
    List<Corso_Laurea> getCorsiLaurea() throws DataLayerException;
    List<Libro_Testo> getLibriTesto() throws DataLayerException;
    List<Materiale> getMateriali() throws DataLayerException;
    
    void storeUtente(Utente utente) throws DataLayerException;
    void storeCorso(Corso corso) throws DataLayerException;
   
}
