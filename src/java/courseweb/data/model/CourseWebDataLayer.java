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
    List<Utente> getUtenti() throws DataLayerException;
    List<Corso> getCorsi() throws DataLayerException;
    List<Corso_Laurea> getCorsoLaurea() throws DataLayerException;
    void storeUtente(Utente utente) throws DataLayerException;
    void storeCorso(Corso corso) throws DataLayerException;
    void storeCorsoLaurea(Corso_Laurea corso_laurea) throws DataLayerException;
   
}
