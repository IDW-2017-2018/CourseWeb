/*
 * Classe LibroTestoImpl
 */
package courseweb.data.impl;

import courseweb.data.model.CourseWebDataLayer; 
import courseweb.data.model.LibroTesto;

/**
 *
 * @author valen
 */
public class LibroTestoImpl implements LibroTesto{
    
    private int id; 
    private String autore; 
    private String titolo; 
    private String volume; 
    private String anno; 
    private String editore; 
    private String link; 
    
    private CourseWebDataLayer ownerDataLayer;
    protected boolean dirty; 
    
    public LibroTestoImpl(CourseWebDataLayer ownerDataLayer){
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
    
    @Override
    public void setAutore(String autore){
        this.autore = autore; 
    }
    
    @Override
    public void setTitolo(String titolo){
        this.titolo = titolo; 
    }
    
    @Override
    public void setEditore(String editore){
        this.editore = editore; 
    }
    
    @Override
    public void setVolume(String volume){
        this.volume = volume; 
    }
    
    @Override
    public void setAnno(String anno){
        this.anno = anno; 
    }
    
    @Override
    public void setLink(String link){
        this.link = link; 
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
