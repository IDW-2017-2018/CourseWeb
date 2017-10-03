/*
 * Classe che specifica l'eccezione DataLayerException
 */
package framework.data;

/**
 *
 * @author Riccardo
 */
public class DataLayerException extends Exception {
    
    public DataLayerException(String message){
        super(message); 
    }
    
    @Override
    public String getMessage(){
        return super.getMessage(); 
    }
    
}
