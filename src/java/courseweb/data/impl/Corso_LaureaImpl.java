/*
 * Classe Corso_LaureaImpl
 */
package courseweb.data.impl;

import courseweb.data.model.CourseWebDataLayer; 
import courseweb.data.model.Corso_Laurea; 

/**
 *
 * @author Riccardo
 */
public class Corso_LaureaImpl implements Corso_Laurea {
    
    private int id; 
    private String nome; 
    private CourseWebDataLayer ownerDataLayer; 
    protected boolean dirty; 
    
    public Corso_LaureaImpl(CourseWebDataLayer ownerDataLayer){
        this.ownerDataLayer = ownerDataLayer; 
        this.id = 0; 
        this.nome = ""; 
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
    public void setNome(String nome){
        this.nome = nome; 
    }
    
    protected void setId(int id){
        this.id = id; 
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