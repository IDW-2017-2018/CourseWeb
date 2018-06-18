/*
 * Classe LibroTestoImpl
 */
package courseweb.data.impl;

import courseweb.data.model.CourseWebDataLayer; 
import courseweb.data.model.Libro_Testo;
import framework.data.DataLayerException;

/**
 *
 * @author valen
 */
public class Libro_TestoImpl implements Libro_Testo {
    
    private int id; 
    private String autore; 
    private String titolo; 
    private String volume; 
    private String anno; 
    private String editore; 
    private String link; 
    
    private CourseWebDataLayer ownerDataLayer;
    protected boolean dirty; 
    
    public Libro_TestoImpl(CourseWebDataLayer ownerDataLayer){
        this.ownerDataLayer = ownerDataLayer; 
        this.id = 0; 
        this.autore = ""; 
        this.titolo = ""; 
        this.editore = ""; 
        this.volume = ""; 
        this.anno = ""; 
        this.link = ""; 
        this.dirty = false; 
    }
    
    @Override 
    public int getId(){
        return this.id; 
    }
    
    @Override
    public String getAutore(){
        return this.autore; 
    }
    
    @Override
    public String getTitolo(){
        return this.titolo; 
    }
    
    @Override
    public String getEditore(){
        return this.editore; 
    }
    
    @Override
    public String getVolume(){
        return this.volume; 
    }
    
    @Override
    public String getAnno(){
        return this.anno; 
    }
    
    @Override
    public String getLink(){
        return this.link; 
    }
    
    protected void setId(int id){
        this.id = id; 
        this.dirty = true; 
    }
    
    @Override
    public void setAutore(String autore){
        this.autore = autore; 
        this.dirty = true;
    }
    
    @Override
    public void setTitolo(String titolo){
        this.titolo = titolo; 
        this.dirty = true;
    }
    
    @Override
    public void setEditore(String editore){
        this.editore = editore; 
        this.dirty = true;
    }
    
    @Override
    public void setVolume(String volume){
        this.volume = volume; 
        this.dirty = true;
    }
    
    @Override
    public void setAnno(String anno){
        this.anno = anno; 
        this.dirty = true;
    }
    
    @Override
    public void setLink(String link){
        this.link = link; 
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
    public void copyFrom(Libro_Testo libro_testo) throws DataLayerException {
        
        id = libro_testo.getId();
        autore = libro_testo.getAutore();
        titolo = libro_testo.getTitolo();
        editore = libro_testo.getEditore();
        volume = libro_testo.getVolume();
        anno = libro_testo.getAnno();
        link = libro_testo.getLink();
        dirty = true;
        
    }
    
    @Override
    public boolean equals(Object o){
        if(o instanceof Libro_Testo){
            return this.titolo.equals(((Libro_Testo) o).getTitolo());
        } else return false;
    }
    
    @Override
    public int compareTo(Libro_Testo o){
        return this.titolo.compareTo(o.getTitolo());
    }
}
