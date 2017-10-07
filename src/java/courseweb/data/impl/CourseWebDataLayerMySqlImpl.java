/*
 * class CourseWebDataLayerMySqlImpl
 */
package courseweb.data.impl;

import framework.data.DataLayerException;
import framework.data.DataLayerMySqlImpl;
import courseweb.data.model.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author valen
 */
public class CourseWebDataLayerMySqlImpl extends DataLayerMySqlImpl implements CourseWebDataLayer {
    
    private PreparedStatement sCorsoByCodiceAnno, iCorsoByCodiceAnno, uCorsoByCodiceAnno;
    private PreparedStatement sUtenteById, sUtenteByEmail, uUtenteByEmail, uUtenteById;

    @Override
    public void init() throws DataLayerException{
        try  {
            super.init();
            // precompilo le query
            sCorsoByCodiceAnno = connection.prepareStatement("SELECT * FROM corsi WHERE codice=? AND anno=?");
            iCorsoByCodiceAnno = connection.prepareStatement("INSERT INTO corsi (codice,anno,nome) VALUES(?,?,?)", Statement.RETURN_GENERATED_KEYS);
            uCorsoByCodiceAnno = connection.prepareStatement("UPDATE corsi SET codice=?, anno=?, ssd=?, semestre=?, lingua=?, prerequisiti=?, obiettivi=?, mod_esame=?, mod_insegnamento=?, sillabo=?, link_homepage=?, link_risorse=?, link_forum=?, note=? WHERE codice=? AND anno=?");
            
            sUtenteById = connection.prepareStatement("SELECT * FROM utenti WHERE id=?");
            sUtenteByEmail = connection.prepareStatement("SELECT * FROM utenti WHERE email=?");
            uUtenteById = connection.prepareStatement("UPDATE utenti SET email=?, password=?, nome=?, cognome=? WHERE id=?");
            uUtenteByEmail = connection.prepareStatement("UPDATE utenti SET email=?, password=?, nome=?, cognome=? WHERE email=?");
        }
        catch(SQLException exc){
            throw new DataLayerException("Error in initializing CourseWeb DataLayer", exc);
        }  
    }
    
    
}
