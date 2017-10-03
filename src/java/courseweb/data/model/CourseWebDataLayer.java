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
public interface CourseWebDataLayer {
    
    Utente createUtente();
    Corso createCorso();
    List<Utente> getUtenti() throws DataLayerException;
    List<Corso> getCorsi() throws DataLayerException;
    void storeUtente(Utente utente) throws DataLayerException;
    void storeCorso(Corso corso) throws DataLayerException;
   
}
