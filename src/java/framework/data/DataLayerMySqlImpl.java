/*
 * Classe DataLayerMySqlImpl
 */
package framework.data;


import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.naming.InitialContext;

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
            InitialContext ctx = new InitialContext();
            datasource = (DataSource) ctx.lookup("java:comp/env/jdbc/courseweb");
            
            //database connection
            connection = datasource.getConnection();
        } 
        catch (SQLException ex1) {
            throw new DataLayerException("Error initializing data layer", ex1);
        }
        
        catch (NamingException ex2) {
            throw new DataLayerException("Error initializing data layer", ex2);
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
