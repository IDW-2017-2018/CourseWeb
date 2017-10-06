/*
 * Interfaccia LibroTesto
 */
package courseweb.data.model;

/**
 *
 * @author valen
 */
public interface Libro_Testo {
    
    int getId(); 
    String getAutore(); 
    String getTitolo(); 
    String getVolume(); 
    String getAnno(); 
    String getEditore(); 
    String getLink(); 
    
    void setAutore(String autore); 
    void setTitolo(String titolo); 
    void setVolume(String volume); 
    void setAnno(String anno); 
    void setEditore(String editore); 
    void setLink(String link);
    
    void setDirty(boolean dirty); 
    boolean isDirty();  
    
}
