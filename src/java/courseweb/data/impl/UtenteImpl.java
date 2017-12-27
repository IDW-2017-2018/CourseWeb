/*
 * Classe UtenteImpl
 */
package courseweb.data.impl;

import courseweb.data.model.Utente;
import courseweb.data.model.CourseWebDataLayer;
import framework.data.DataLayerException;

/**
 *
 * @author valen
 */
public class UtenteImpl implements Utente{
    
    private int id; 
    private String email; 
    private String password; 
    private String tipoUtente; 
    private String nome; 
    private String cognome;
    private CourseWebDataLayer ownerDataLayer;
    protected boolean dirty; 
    
    public UtenteImpl(CourseWebDataLayer ownerDataLayer) {
        
        this.ownerDataLayer = ownerDataLayer;
        this.id = 0;
        this.email = "";
        this.password = "";
        this.tipoUtente = "";
        this.nome = "";
        this.cognome = "";
        this.dirty = false; 
        
    }
    
    @Override
    public int getId() {   
        return this.id;  
    }
    
    @Override
    public String getEmail() {  
        return this.email;  
    }
    
    @Override
    public String getPassword() {  
        return this.password;  
    }
    
    @Override
    public String getTipoUtente() { 
        return this.tipoUtente;
    }
    
    @Override
    public String getNome() { 
        return this.nome;  
    }
    
    @Override
    public String getCognome() {   
        return this.cognome;    
    }
    
    protected void setId(int id) {   
        this.id = id;   
    }
    
    @Override
    public void setEmail(String email) {    
        this.email = email;   
    }
    
    @Override
    public void setPassword(String password) {   
        this.password = password;  
    }
    
    @Override
    public void setTipoUtente(String tipoUtente) {  
        this.tipoUtente = tipoUtente;  
    }
    
    @Override
    public void setNome(String nome) {  
        this.nome = nome;  
    }
    
    @Override
    public void setCognome(String cognome) {   
        this.cognome = cognome;  
    }
    
    @Override
    public void copyFrom(Utente utente) throws DataLayerException{
        id = utente.getId();
        email = utente.getEmail();
        password = utente.getPassword();
        tipoUtente = utente.getTipoUtente(); 
        nome = utente.getNome();
        cognome = utente.getCognome();
        this.dirty = true;
    }
    
    @Override
    public void setDirty(boolean dirty){
        this.dirty = dirty; 
    }
    
    @Override
    public boolean isDirty(){
        return this.dirty; 
    }
    
}
