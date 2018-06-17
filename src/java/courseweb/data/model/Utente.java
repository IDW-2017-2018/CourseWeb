/*
 * Interfaccia Utente
 */
package courseweb.data.model;

import framework.data.DataLayerException;

/**
 *
 * @author Riccardo
 */
public interface Utente extends Comparable<Utente> {
    
    int getId(); 
    String getEmail(); 
    String getPassword(); 
    String getTipoUtente(); 
    String getNome(); 
    String getCognome(); 
    
    void setEmail(String email); 
    void setPassword(String password); 
    void setTipoUtente(String tipo_utente); 
    void setNome(String nome); 
    void setCognome(String cognome); 
    
    void copyFrom(Utente utente) throws DataLayerException;
    void setDirty(boolean dirty); 
    boolean isDirty();  
    
}
