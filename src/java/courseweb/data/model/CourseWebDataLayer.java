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
    
    Corso getCorso(int corso_key) throws DataLayerException;
    Corso getCorso(String corso_codice, String corso_anno) throws DataLayerException;
    List<Corso> getCorsoByCodice(String corso_codice) throws DataLayerException;
    List<Corso> getCorsoByAnno(String corso_anno) throws DataLayerException;
    List<Corso> getCorsi() throws DataLayerException;
    
    Corso_Laurea getCorsoLaurea(int corso_laurea_key) throws DataLayerException;
    Corso_Laurea getCorsoLaurea(String corso_laurea_nome) throws DataLayerException;
    List<Corso_Laurea> getCorsiLaurea() throws DataLayerException;
    
    Libro_Testo getLibroTesto(int libro_testo_key)throws DataLayerException;
    List<Libro_Testo> getLibriTesto() throws DataLayerException;
    
    Materiale getMateriale(int materiale_key) throws DataLayerException;
    List<Materiale> getMateriali() throws DataLayerException;
    
    List<Corso_Laurea> getCorsiLaureaCorso(Corso corso) throws DataLayerException;
    List<Corso> getCorsiPropedeuticiCorso(Corso corso) throws DataLayerException;
    List<Corso> getCorsiMutuatiCorso(Corso corso) throws DataLayerException;
    List<Corso> getCorsiIntegratiCorso(Corso corso) throws DataLayerException;
    List<Libro_Testo> getLibriTestoCorso(Corso corso) throws DataLayerException;
    List<Materiale> getMaterialiCorso(Corso corso) throws DataLayerException;
    List<Utente> getDocentiCorso(Corso corso) throws DataLayerException;
    
    void storeUtenteById(Utente utente) throws DataLayerException;    
    void storeUtenteByEmail(Utente utente) throws DataLayerException;
    void storeCorso(Corso corso) throws DataLayerException;
   
}
