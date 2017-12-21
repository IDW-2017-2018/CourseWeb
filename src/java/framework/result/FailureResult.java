/*
 * Classe FailureResult
 * 
 * Classe che permette la visualizzazione degli errori tramite template il cui nome
 * compare nella configurazione dell'applicazione (web.xml)
 * in mancanza di esso, si degrada ad un errore http
 */
package framework.result;

import java.io.IOException; 
import java.util.logging.Level; 
import java.util.logging.Logger; 

import javax.servlet.ServletContext; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

/**
 *
 * @author Riccardo
 */
public class FailureResult {
    
    protected ServletContext context; 
    private final TemplateResult template; 
    
    public FailureResult(ServletContext context){
        this.context = context; 
        template = new TemplateResult(context); 
    }
    
    public void activate(Exception exception, HttpServletRequest request, HttpServletResponse response){
        String message; 
        
        if(exception != null && exception.getMessage() != null){
            message = exception.getMessage(); 
        } else if(exception != null){
            message = exception.getClass().getName(); 
        } else {
            message = "Unknown error"; 
        }
        activate(message, request, response); 
    }
    
    public void activate(String message, HttpServletRequest request, HttpServletResponse response){
        
        try {
            
            //se abbiamo registrato un template per i messaggi di errore, usiamo quello
            if(context.getInitParameter("view.error_template") != null){
                request.setAttribute("error", message);
                request.setAttribute("outline_tpl", "");
                request.setAttribute("navbar_tpl", "");
                
                template.activate(context.getInitParameter("view.error_template"), request, response); 
            } else {
                //altrimenti inviamo un errore http 
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, message);
            }
            
        } catch(TemplateManagerException|IOException ex1){
            
            //se qualcosa va male inviamo un errore http 
            message += ". The following exception was generated while trying to display the error page: " + ex1.getMessage(); 
            try {
                
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, message);
                
            } catch(IOException ex2){
                
                Logger.getLogger(FailureResult.class.getName()).log(Level.SEVERE, null, ex2); 
                
            }
        }
        
    }
    
}
