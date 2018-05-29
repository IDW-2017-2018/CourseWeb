/*
 * Interfaccia CourseWebDataLayer
 */
package courseweb.data.model;

import framework.data.DataLayer;
import framework.data.DataLayerException;
import java.util.List;
import java.util.Map;

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
    
    Corso getCorso(int corso_key, String lang) throws DataLayerException;
    List<Corso> getCorso(String corso_codice, String corso_anno, String lang) throws DataLayerException;
    List<Corso> getCorsoByCodice(String corso_codice) throws DataLayerException;
    List<Corso> getCorsoByAnno(String corso_anno) throws DataLayerException;
    List<Corso> getCorsoByNome (String corso_nome) throws DataLayerException;
    List<Corso> getCorsoByNomeVersioni (String corso_nome) throws DataLayerException;
    List<Corso> getCorsi() throws DataLayerException;
    List<Corso> getCorsiAggiornati() throws DataLayerException; 
    List<Corso> getCorsiByNomeAggiornati(String corso_nome) throws DataLayerException;
    
    List<Corso> filterCorsiByLang(String lang, List<Corso> lista_corsi); 
    
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
    List<String> getLogMessage() throws DataLayerException;
    
    void storeUtenteById(Utente utente) throws DataLayerException;    
    void storeUtenteByEmail(Utente utente) throws DataLayerException;
    void storeCorso(Corso corso) throws DataLayerException;
    void storeMateriale(Materiale materiale) throws DataLayerException;
    void storeLibroTesto(Libro_Testo libro_testo) throws DataLayerException;
    
    void storeCorsiCorsiIntegrati(int corso_key, int corso_integrato_key) throws DataLayerException;
    void storeCorsiCorsiMutuati(int corso_key, int corso_mutuato_key) throws DataLayerException;
    void storeCorsiCorsiPropedeutici(int corso_key, int corso_propedeutico_key) throws DataLayerException;
    void storeCorsiCorsiLaurea(int corso_laurea_key, int corso_key, String numero_cfu, String tipo_cfu) throws DataLayerException;
    void storeCorsiDocenti(int corso_key, int docente_key) throws DataLayerException;
    void storeCorsiLibriTesto(int corso_key, int libro_testo_key) throws DataLayerException;
    void storeCorsiMateriali(int corso_key, int materiale_key) throws DataLayerException;
    void storeLogMessage(String message) throws DataLayerException;
    
    void deleteCorsiCorsiIntegrati(int corso_key, int corso_integrato_key) throws DataLayerException;
    void deleteCorsiCorsiMutuati(int corso_key, int corso_mutuato_key) throws DataLayerException;
    void deleteCorsiCorsiPropedeutici(int corso_key, int corso_propedeutico_key) throws DataLayerException;
    void deleteCorsiCorsiLaurea(int corso_laurea_key, int corso_key) throws DataLayerException;
    void deleteCorsiDocenti(int corso_key, int docente_key) throws DataLayerException;
    void deleteCorsiLibriTesto(int corso_key, int libro_testo_key) throws DataLayerException;
    void deleteCorsiMateriali(int corso_key, int materiale_key) throws DataLayerException;
    
    List<Corso> filtraCorsi (List<Corso> corsi, String attributo, String filtro) throws DataLayerException;
    List<Map<String, Object>> getCFU(Corso corso) throws DataLayerException;
    
}
