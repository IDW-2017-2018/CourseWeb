/*
 * Interfaccia DataLayer
 */
package framework.data;

/**
 *
 * @author Flavio
 */
public interface DataLayer extends AutoCloseable {
    
    void init() throws DataLayerException;
    void destroy() throws DataLayerException;
    
}
