/*
 * classe MaterialiImpl
 */
package courseweb.data.impl;

import courseweb.data.model.CourseWebDataLayer; 
import courseweb.data.model.Materiale;
import framework.data.DataLayerException;

/**
 *
 * @author valen
 */
public class MaterialeImpl implements Materiale {
    
    private int id; 
    private String nome; 
    private String descrizione; 
    private String dimensione; 
    private String percorso;
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
    
    @Override
    public void copyFrom(Materiale materiale) throws DataLayerException {
        
        id = materiale.getId();
        nome = materiale.getNome();
        descrizione = materiale.getDescrizione();
        dimensione = materiale.getDimensione();
        percorso = materiale.getPercorso();
        dirty = true;
        
    }
    
}
