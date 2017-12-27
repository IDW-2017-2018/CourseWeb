/*
 * Classe TemplateResult
 *
 * Classe che genera output a partire da template FreeMarker
 * Gestisce vari modelli di dati passati direttamente o tramite request
 * Usa outline automatici 
 */
package framework.result;

import freemarker.core.HTMLOutputFormat;
import freemarker.core.JSONOutputFormat;
import freemarker.core.XMLOutputFormat;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapperBuilder;
import freemarker.template.Template;
import freemarker.template.TemplateDateModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Riccardo
 */
public class TemplateResult {
    
    protected ServletContext context; 
    protected Configuration cfg; 
    protected DataModelFiller filler; 
    
    public TemplateResult(ServletContext context){
        this.context = context; 
        init(); 
    }
    
    private void init(){
        cfg = new Configuration(Configuration.VERSION_2_3_26); 
        
        if(context.getInitParameter("view.encoding") != null){
            cfg.setOutputEncoding(context.getInitParameter("view.encoding"));
            cfg.setDefaultEncoding(context.getInitParameter("view.encoding"));
        }
        
        if(context.getInitParameter("view.template_directory") != null){
            cfg.setServletContextForTemplateLoading(context, context.getInitParameter("view.template_directory"));
        } else {
            cfg.setServletContextForTemplateLoading(context, "templates");
        }
        
        if( (context.getInitParameter("view.debug") != null) && (context.getInitParameter("view.debug").equals("true")) ){
            cfg.setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);
        } else {
            cfg.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
        }
        
        if(context.getInitParameter("view.date_format") != null){
            cfg.setDateTimeFormat(context.getInitParameter("view.date_format"));
        }
        
        //classe che permette di riempire ogni datamodel con dati generati dinamicamente
        filler = null; 
        if(context.getInitParameter("view.model_filler") != null){
            
            try {
                filler = (DataModelFiller) Class.forName(context.getInitParameter("view.model_filler")).newInstance(); 
            } catch(ClassNotFoundException ex1){
                Logger.getLogger(TemplateResult.class.getName()).log(Level.SEVERE, null, ex1);
            } catch(InstantiationException ex2){
                Logger.getLogger(TemplateResult.class.getName()).log(Level.SEVERE, null, ex2);
            } catch(IllegalAccessException ex3){
                Logger.getLogger(TemplateResult.class.getName()).log(Level.SEVERE, null, ex3);
            }
            
        }
        
        //gestore oggetti
        DefaultObjectWrapperBuilder owb = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_26); 
        owb.setForceLegacyNonListCollections(false);
        owb.setDefaultDateType(TemplateDateModel.DATETIME);
        cfg.setObjectWrapper(owb.build());
    }
    
    //resttuisce un DataModel (hash) di base
    protected Map getDefaultDataModel(){
        
        Map default_data_model = new HashMap(); 
        
        if(filler != null){
            filler.fillDataModel(default_data_model);
        }
        
        default_data_model.put("outline_tpl", context.getInitParameter("view.outline_template_eng")); 
        
        //aggiungiamo dati presi da web.xml del tipo view.data.*
        Map init_tpl_data = new HashMap(); 
        default_data_model.put("defaults", init_tpl_data); 
        
        Enumeration params = context.getInitParameterNames(); 
        while(params.hasMoreElements()){
            String name = (String) params.nextElement(); 
            
            if(name.startsWith("view.data.")){
                init_tpl_data.put(name.substring(10), context.getInitParameter(name)); 
            }
        }
        
        return default_data_model; 
    }
    
    //restituzione del DataModel estratto dagli attributi della request 
    protected Map getRequestDataModel(HttpServletRequest request){
        Map datamodel = new HashMap(); 
        
        Enumeration attributes = request.getAttributeNames(); 
        
        while(attributes.hasMoreElements()){
            String attributename = (String) attributes.nextElement(); 
            
            datamodel.put(attributename, request.getAttribute(attributename)); 
        }
        if(request.getAttribute("lang") != null) {
            
        if(request.getAttribute("lang").equals("ita")){
            if(request.getAttribute("error") != null){
                datamodel.put("outline_tpl", "");
            } else {
                datamodel.put("outline_tpl", context.getInitParameter("view.outline_template_ita"));
            }
        } 
        
        }
        
        return datamodel; 
        
    }
    
    //metodo che si occupa di chiamare FreeMarker e compilare il template
    protected void process(String tplname, Map datamodel, Writer out) throws TemplateManagerException {
        
        Template t; 
        
        Map<String, Object> localdatamodel = getDefaultDataModel(); 
        
        if(datamodel != null){
            localdatamodel.putAll(datamodel);
        }
        
        String outline_name = (String)localdatamodel.get("outline_tpl"); 
        
        try {
            
            if(outline_name == null || outline_name.isEmpty()){
                t = cfg.getTemplate(tplname); 
            } else {
                t = cfg.getTemplate(outline_name); 
                
                localdatamodel.put("content_tpl", tplname); 
                
            }
            
            t.process(localdatamodel, out);
            
        } catch(IOException ex1){
            throw new TemplateManagerException("Template error: " + ex1.getMessage(), ex1); 
        } catch(TemplateException ex2){
            throw new TemplateManagerException("Template error: " + ex2.getMessage(), ex2); 
        }
        
    }
    
    //activate che accetta modello dati esplicito
    public void activate(String tplname, Map datamodel, HttpServletResponse response) throws TemplateManagerException {
        
        String contentType = (String)datamodel.get("contentType"); 
        
        if(contentType == null){
            contentType = "text/html"; 
        }
        response.setContentType(contentType);
        
        //impostiamo il tipo di output
        switch(contentType){
            case "text/html":
                cfg.setOutputFormat(HTMLOutputFormat.INSTANCE);
                break;
                
            case "text/xml":
            
            case "application/xml":
                cfg.setOutputFormat(XMLOutputFormat.INSTANCE);
                break;
                
            case "application/json":
                cfg.setOutputFormat(JSONOutputFormat.INSTANCE);
                break;
                
            default:
                break; 
                
        }
        
        String encoding = (String)datamodel.get("encoding"); 
        
        if(encoding == null){
            encoding = cfg.getOutputEncoding(); 
        }
        response.setCharacterEncoding(encoding);
        
        try {
            process(tplname, datamodel, response.getWriter()); 
        } catch(IOException ex){
            throw new TemplateManagerException("Template error: " + ex.getMessage(), ex); 
        }
        
    }
    
    //activate che estrae modello dati dagli attibuti della request
    public void activate(String tplname, HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        
        Map datamodel = getRequestDataModel(request); 
        activate(tplname, datamodel, response); 
        
    }
    
    //activate che genera output non diretto verso il browser (es. file)
    public void activate(String tplname, Map datamodel, OutputStream out) throws TemplateManagerException {
        
        String encoding = (String)datamodel.get("encoding"); 
        
        if(encoding == null){
            encoding = cfg.getOutputEncoding(); 
        }
        
        try {
            
            process(tplname, datamodel, new OutputStreamWriter(out, encoding)); 
            
        } catch(UnsupportedEncodingException ex){
            throw new TemplateManagerException("Template error: " + ex.getMessage(), ex); 
        }
        
    }
    
}
