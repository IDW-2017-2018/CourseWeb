/*
 * Interfaccia DataModelFiller
 * 
 * fillDataModel() viene richiamato su tutti i DataModel usati da TemplateManager
 * e può inserirvi dati generati automaticamente e validi per tutti i template
 *
 * Il nome completo di una classe che implementa questa interfaccia deve essere registrato nel parametro
 * del contesto view.model_filler
 */
package framework.result;

import java.util.Map; 

/**
 *
 * @author Riccardo
 */
public interface DataModelFiller {
    
    public void fillDataModel(Map datamodel); 
    
}
