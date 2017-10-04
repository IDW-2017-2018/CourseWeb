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
    
    public Corso_LaureaImpl(CourseWebDataLayer ownerDataLayer){
        this.ownerDataLayer = ownerDataLayer; 
        this.id = 0; 
        this.nome = ""; 
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
}
