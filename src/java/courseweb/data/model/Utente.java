/*
 * Interfaccia Utente
 */
package courseweb.data.model;

/**
 *
 * @author Riccardo
 */
public interface Utente {
    
    int getId(); 
    String getEmail(); 
    String getPassword(); 
    String getTipoUtente(); 
    String getNome(); 
    String getCognome(); 
    
    void setId(int id); 
    void setEmail(String email); 
    void setPassword(String password); 
    void setTipoUtente(String tipo_utente); 
    void setNome(String nome); 
    void setCognome(String cognome); 
    
}
