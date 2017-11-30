/*
 * Interfaccia Materiale
 */
package courseweb.data.model;

/**
 *
 * @author valen
 */
public interface Materiale {
    
    int getId(); 
    String getNome(); 
    String getDescrizione(); 
    String getDimensione(); 
    String getPercorso(); 
   
    void setNome(String nome); 
    void setDescrizione(String descrizione); 
    void setDimensione(String dimensione); 
    void setPercorso(String percorso);
    
    void setDirty(boolean dirty); 
    boolean isDirty();  
    
}
