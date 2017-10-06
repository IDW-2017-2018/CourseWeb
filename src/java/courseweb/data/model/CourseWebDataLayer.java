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
    
    List<Utente> getUtenti() throws DataLayerException;
    List<Corso> getCorsi() throws DataLayerException;
    List<Corso_Laurea> getCorsiLaurea() throws DataLayerException;
    List<Libro_Testo> getLibriTesto() throws DataLayerException;
    List<Materiale> getMateriali() throws DataLayerException;
    
    void storeUtente(Utente utente) throws DataLayerException;
    void storeCorso(Corso corso) throws DataLayerException;
    void storeCorsoLaurea(Corso_Laurea corso_laurea) throws DataLayerException;
    void storeLibroTesto(Libro_Testo libro_testo) throws DataLayerException;
    void storeMateriale(Materiale materiale) throws DataLayerException;
   
}
