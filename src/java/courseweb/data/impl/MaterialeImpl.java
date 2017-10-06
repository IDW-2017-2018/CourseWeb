/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package courseweb.data.impl;

import courseweb.data.model.CourseWebDataLayer; 
import courseweb.data.model.Materiale;

/**
 *
 * @author valen
 */
public class MaterialeImpl implements Materiale {
    
    private int id; 
    String nome; 
    String descrizione; 
    String dimensione; 
    String percorso;
    private CourseWebDataLayer ownerDataLayer;
    protected boolean dirty;
   
    public MaterialeImpl(CourseWebDataLayer ownerDataLayer){
        
        this.ownerDataLayer = ownerDataLayer;
        this.id = 0;
        this.nome = "";
        this.descrizione = "";
        this.dimensione = "";
        this.percorso = "";
        this.dirty = false;
        
    }
    
    @Override
    public int getId(){
        return this.id;
    }
    
    @Override
    public String getNome(){
        return this.nome;
    }
    
    @Override
    public String getDescrizione(){
        return this.descrizione;
    }
    
    @Override
    public String getDimensione(){
        return this.dimensione;
    }
    
    @Override
    public String getPercorso(){
        return this.percorso;
    }
    
    protected void setId(int id) {   
        this.id = id;   
    }
    
    @Override
    public void setNome(String nome) {    
        this.nome = nome;   
    }
    
    @Override
    public void setDescrizione(String descrizione) {    
        this.descrizione = descrizione;   
    }
    
    @Override
    public void setDimensione(String dimensione) {    
        this.dimensione = dimensione;   
    }
    
    @Override
    public void setPercorso(String percorso) {    
        this.percorso = percorso;   
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
