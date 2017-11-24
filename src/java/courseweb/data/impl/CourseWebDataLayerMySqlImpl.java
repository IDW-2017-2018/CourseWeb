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
    
    private PreparedStatement sCorso, sCorsoByCodice, sCorsoByAnno, sCorsoByCodiceAnno, uCorsoByCodiceAnno, iCorsoByCodiceAnno;
    private PreparedStatement sUtente, sUtenteById, sUtenteByEmail, uUtenteById, uUtenteByEmail, iUtente;
    private PreparedStatement sCorsoLaurea, sCorsoLaureaById, sCorsoLaureaByNome;
    private PreparedStatement sLibroTestoById;
    private PreparedStatement sMaterialeById;
    
    private PreparedStatement sDocenti;
    private PreparedStatement sCorsiPropedeutici;
    private PreparedStatement sCorsiMutuati;
    private PreparedStatement sCorsiIntegrati;
    private PreparedStatement sCorsiLibriTesto;
    private PreparedStatement sCorsiCorsiLaurea;
    private PreparedStatement sCorsiMateriali;     
            
    @Override
    public void init() throws DataLayerException{
        try  {
            super.init();
            // precompilo le query
            sCorso = connection.prepareStatement("SELECT * FROM corsi");
            sCorsoByCodice = connection.prepareStatement("SELECT * FROM corsi WHERE codice=?");
            sCorsoByAnno = connection.prepareStatement("SELECT * FROM corsi WHERE anno=?");
            sCorsoByCodiceAnno = connection.prepareStatement("SELECT * FROM corsi WHERE codice=? AND anno=?");
            uCorsoByCodiceAnno = connection.prepareStatement("UPDATE corsi SET codice=?, anno=?, ssd=?, semestre=?, lingua=?, prerequisiti=?, obiettivi=?, mod_esame=?, mod_insegnamento=?, sillabo=?, link_homepage=?, link_risorse=?, link_forum=?, note=? WHERE codice=? AND anno=?");
            iCorsoByCodiceAnno = connection.prepareStatement("INSERT INTO corsi (codice,anno,nome) VALUES(?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
            sUtente = connection.prepareStatement("SELECT * FROM utenti");
            sUtenteById = connection.prepareStatement("SELECT * FROM utenti WHERE id=?");
            sUtenteByEmail = connection.prepareStatement("SELECT * FROM utenti WHERE email=?");
            uUtenteById = connection.prepareStatement("UPDATE utenti SET email=?, password=?, nome=?, cognome=? WHERE id=?");
            uUtenteByEmail = connection.prepareStatement("UPDATE utenti SET email=?, password=?, nome=?, cognome=? WHERE email=?");
            iUtente = connection.prepareStatement("INSERT INTO utenti (email,password,tipo_utente,nome,cognome) VALUES(?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
            sCorsoLaurea = connection.prepareStatement("SELECT * FROM corsi_laurea");
            sCorsoLaureaById = connection.prepareStatement("SELECT * FROM corsi_laurea WHERE id=?");
            sCorsoLaureaByNome = connection.prepareStatement("SELECT * FROM corsi_laurea WHERE nome=?");
            
            sLibroTestoById = connection.prepareStatement("SELECT * FROM libri_testo WHERE id=?");
            
            sMaterialeById = connection.prepareStatement("SELECT * FROM materiali WHERE id=?");
            
            //query complesse
            sDocenti = connection.prepareStatement("SELECT * FROM utenti WHERE tipo_utente='docente'");
            
            sCorsiPropedeutici = connection.prepareStatement("SELECT * FROM corsi_corsi_propedeutici INNER JOIN corsi ON (corsi_corsi_propedeutici.id_corso_propedeutico = corsi.id) WHERE corsi_corsi_propedeutici.id_corso=?");
            sCorsiMutuati = connection.prepareStatement("SELECT * FROM corsi_corsi_mutuati INNER JOIN corsi ON (corsi_corsi_mutuati.id_corso_mutuato = corsi.id) WHERE corsi_corsi_mutuati.id_corso=?");
            sCorsiIntegrati = connection.prepareStatement("SELECT * FROM corsi_corsi_integrati INNER JOIN corsi ON (corsi_corsi_integrati.id_corso_integrato = corsi.id) WHERE corsi_corsi_integrati.id_corso=?");
            sCorsiLibriTesto = connection.prepareStatement("SELECT * FROM corsi_libri_testo INNER JOIN libri_testo ON (corsi_libri_testo.id_libro_testo = libri_testo.id) WHERE corsi_libri_testo.id_corso=?");
            sCorsiCorsiLaurea = connection.prepareStatement("SELECT * FROM corsi_corsi_laurea INNER JOIN corsi_laurea ON (corsi_corsi_laurea.id_corso_laurea = corsi_laurea.id) WHERE corsi_corsi_laurea.id_corso=?");  
            sCorsiMateriali = connection.prepareStatement("SELECT * FROM materiali_corsi INNER JOIN materiali ON (materiali_corsi.id_materiale = materiali.id) WHERE materiali_corsi.id_corso=?");
        }
        catch(SQLException exc){
            throw new DataLayerException("Error in initializing CourseWeb DataLayer", exc);
        }  
    }
    
    
}
