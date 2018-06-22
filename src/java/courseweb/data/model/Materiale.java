/*
 * Interfaccia Materiale
 */
package courseweb.data.model;

import framework.data.DataLayerException;

/**
 *
 * @author valen
 */
public interface Materiale extends Comparable<Materiale> {
    
    int getId(); 
    String getNome(); 
    String getDescrizione(); 
    long getDimensione(); 
    String getPercorso(); 
    int getUtenteId();
   
    void setNome(String nome); 
    void setDescrizione(String descrizione); 
    void setDimensione(long dimensione); 
    void setPercorso(String percorso);
    void setUtenteId(int utente_key);
    
    void copyFrom(Materiale materiale) throws DataLayerException;
    void setDirty(boolean dirty); 
    boolean isDirty();  
    
}
