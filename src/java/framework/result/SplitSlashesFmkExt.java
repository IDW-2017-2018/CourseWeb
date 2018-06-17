/*
 * Classe SplitSlashesFmkExt
 * classe richiamabile da templates freemarker che rimuove gli slashes nei risultati delle query visualizzati dall'utente
 */
package framework.result;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

import framework.security.SecurityLayer;

import java.util.List;

/**
 *
 * @author valen
 */
public class SplitSlashesFmkExt implements TemplateMethodModelEx {

    @Override
    public Object exec(List list) throws TemplateModelException {
        
        //la lista contiene i parametri passati alla funzione nel template
        if(!list.isEmpty()) {
            if(list.get(0) != null){
                return SecurityLayer.stripSlashes(list.get(0).toString());
            }
            else {
                return "";
            }
        } else {
            //è possibile ritornare qualsiasi tipo che sia gestibile da freemarker
            return "";
            
        }
        
    }
}
