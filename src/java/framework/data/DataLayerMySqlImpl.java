/*
 * Classe DataLayerMySqlImpl
 */
package framework.data;


import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author valen
 */
public class DataLayerMySqlImpl implements DataLayer {
    
    protected DataSource datasource;
    protected Connection connection;
    
    public DataLayerMySqlImpl(DataSource datasource) throws SQLException, NamingException {
        
        super();
        this.datasource = datasource;
        this.connection = null;
        
    }
    
    @Override
    public void init() throws DataLayerException {
        
        try{
            //database connection
            connection = datasource.getConnection();
        } 
        catch (SQLException sqlex) {
            throw new DataLayerException("Error initializing data layer", sqlex);
        }
        
    }
    
    @Override
    public void destroy() {
        
        try{
            if(connection != null) {
                connection.close();
                connection = null;
            }
        } 
        catch(SQLException sqlex) {
        //
        }
        
    }
    
    @Override
    //method from the AutoCloseable interface
    public void close() throws Exception {
        
        destroy();
        
    }
    
}
