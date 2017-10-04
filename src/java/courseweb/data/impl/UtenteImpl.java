/*
 * Classe UtenteImpl
 */
package courseweb.data.impl;

import courseweb.data.model.Utente;
import courseweb.data.model.CourseWebDataLayer;

/**
 *
 * @author valen
 */
public class UtenteImpl implements Utente{
    
    private int id; 
    private String email; 
    private String password; 
    private String tipo_utente; 
    private String nome; 
    private String cognome;
    private CourseWebDataLayer ownerDataLayer;
    protected boolean dirty; 
    
    public UtenteImpl(CourseWebDataLayer ownerDataLayer) {
        
        this.ownerDataLayer = ownerDataLayer;
        this.id = 0;
        this.email = "";
        this.password = "";
        this.tipo_utente = "";
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
        return this.tipo_utente;
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
    public void setTipoUtente(String tipo_utente) {  
        this.tipo_utente = tipo_utente;  
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
    public void setDirty(boolean dirty){
        this.dirty = dirty; 
    }
    
    @Override
    public boolean isDirty(){
        return this.dirty; 
    }
    
}
