/*
 * Interfaccia Materiale
 */
package courseweb.data.model;

import framework.data.DataLayerException;

/**
 *
 * @author valen
 */
public interface Materiale {
    
    int getId(); 
    String getNome(); 
    String getDescrizione(); 
    long getDimensione(); 
    String getPercorso(); 
   
    void setNome(String nome); 
    void setDescrizione(String descrizione); 
    void setDimensione(long dimensione); 
    void setPercorso(String percorso);
    
    void copyFrom(Materiale materiale) throws DataLayerException;
    void setDirty(boolean dirty); 
    boolean isDirty();  
    
}
