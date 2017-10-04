/*
 * Interfaccia Corso_Laurea
 */
package courseweb.data.model;

/**
 *
 * @author Riccardo
 */
public interface Corso_Laurea {
    
    int getId(); 
    String getNome(); 
    
    void setNome(String nome); 
    
    void setDirty(boolean dirty); 
    boolean isDirty();  
  
}
