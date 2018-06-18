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
    private long dimensione; 
    private String percorso;
    private CourseWebDataLayer ownerDataLayer;
    protected boolean dirty;
   
    public MaterialeImpl(CourseWebDataLayer ownerDataLayer){
        
        this.ownerDataLayer = ownerDataLayer;
        this.id = 0;
        this.nome = "";
        this.descrizione = "";
        this.dimensione = 0;
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
    public long getDimensione(){
        return this.dimensione;
    }
    
    @Override
    public String getPercorso(){
        return this.percorso;
    }
    
    protected void setId(int id) {   
        this.id = id;   
        this.dirty = true;
    }
    
    @Override
    public void setNome(String nome) {    
        this.nome = nome; 
        this.dirty = true;
    }
    
    @Override
    public void setDescrizione(String descrizione) {    
        this.descrizione = descrizione;   
        this.dirty = true;
    }
    
    @Override
    public void setDimensione(long dimensione) {    
        this.dimensione = dimensione;   
        this.dirty = true;
    }
    
    @Override
    public void setPercorso(String percorso) {    
        this.percorso = percorso;   
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
    
    @Override
    public void copyFrom(Materiale materiale) throws DataLayerException {
        
        id = materiale.getId();
        nome = materiale.getNome();
        descrizione = materiale.getDescrizione();
        dimensione = materiale.getDimensione();
        percorso = materiale.getPercorso();
        dirty = true;
        
    }    

    @Override
    public boolean equals(Object o){
        if(o instanceof Materiale){
            return this.nome.equals(((Materiale) o).getNome());
        } else return false;
    }
    
    @Override
    public int compareTo(Materiale o){
        return this.nome.compareTo(o.getNome());
    }
}
