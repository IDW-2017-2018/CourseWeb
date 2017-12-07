/*
 * Classe che specifica l'eccezione SecurityLayerException 
 */
package framework.security;

/**
 *
 * @author valen
 */
public class SecurityLayerException extends Exception {
    
    public SecurityLayerException(String message){
        super(message); 
    }
    
    public SecurityLayerException(String message, Throwable cause){
        super(message, cause); 
    }
    
    public SecurityLayerException(Throwable cause){
        super(cause); 
    }
    
}
