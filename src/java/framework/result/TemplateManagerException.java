/*
 * Classe che specifica l'eccezione TemplateManagerException
 */
package framework.result;

/**
 *
 * @author Riccardo
 */
public class TemplateManagerException extends Exception {
    
    public TemplateManagerException(String message){
        super(message); 
    }
    
    public TemplateManagerException(String message, Throwable cause){
        super(message, cause); 
    }
    
    public TemplateManagerException(Throwable cause){
        super(cause); 
    }
     
}
