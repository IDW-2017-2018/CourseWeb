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
    
    private PreparedStatement sDocenti, sDocenteById, sDocenteByEmail;
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
            sDocenteById = connection.prepareStatement("SELECT * FROM utenti WHERE tipo_utente='docente' AND id=?");
            sDocenteByEmail = connection.prepareStatement("SELECT * FROM utenti WHERE tipo_utente='docente' AND email=?");
            
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
    
    @Override
    public Utente createUtente() {
        return new UtenteImpl(this); 
    }
    
    public Utente createUtente(ResultSet rs) throws DataLayerException {
        try {
            
            UtenteImpl u = new UtenteImpl(this); 
            
            u.setId(rs.getInt("id"));
            u.setEmail(rs.getString("email"));
            u.setPassword(rs.getString("password"));
            u.setTipoUtente(rs.getString("tipo_utente"));
            u.setNome(rs.getString("nome"));
            u.setCognome(rs.getString("cognome"));
            
            return u; 
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to create Utente object from ResultSet", ex); 
        }
    }
    
    @Override
    public Corso createCorso() {
        return new CorsoImpl(this); 
    }
    
    public Corso createCorso(ResultSet rs) throws DataLayerException {
        try {
            
            CorsoImpl c = new CorsoImpl(this); 
            
            c.setId(rs.getInt("id"));
            c.setCodice(rs.getString("codice"));
            c.setAnno(rs.getString("anno"));
            c.setNome(rs.getString("nome"));
            c.setSSD(rs.getString("SSD"));
            c.setSemestre(rs.getInt("semestre"));
            c.setLingua(rs.getString("lingua"));
            c.setPrerequisiti(rs.getString("prerequisiti"));
            c.setObiettivi(rs.getString("obiettivi"));
            c.setModEsame(rs.getString("mod_esame")); 
            c.setModInsegnamento(rs.getString("mod_insegnamento"));
            c.setSillabo(rs.getString("sillabo")); 
            c.setLinkHomepageCorso(rs.getString("link_homepage"));
            c.setLinkRisorseEsterne(rs.getString("link_risorse"));
            c.setLinkForum(rs.getString("link_forum"));
            c.setNote(rs.getString("note"));
            
            return c; 
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to create Corso object from ResultSet", ex); 
        }
    }
    
    @Override
    public Corso_Laurea createCorsoLaurea() {
        return new Corso_LaureaImpl(this); 
    }
    
    public Corso_Laurea createCorsoLaurea(ResultSet rs) throws DataLayerException {
        try {
            
            Corso_LaureaImpl c = new Corso_LaureaImpl(this); 
            
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            
            return c; 
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to create Corso_Laurea object from ResultSet", ex); 
        }
    }
    
    @Override
    public Libro_Testo createLibroTesto() {
        return new Libro_TestoImpl(this); 
    }
    
    public Libro_Testo createLibroTesto(ResultSet rs) throws DataLayerException {
        try {
            
            Libro_TestoImpl l = new Libro_TestoImpl(this); 
            
            l.setId(rs.getInt("id"));
            l.setAutore(rs.getString("autore"));
            l.setTitolo(rs.getString("titolo"));
            l.setVolume(rs.getString("volume"));
            l.setAnno(rs.getString("anno"));
            l.setEditore(rs.getString("editore"));
            l.setLink(rs.getString("link"));
            
            return l; 
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to create Libro_Testo object from ResultSet", ex); 
        }
    }
    
    @Override
    public Materiale createMateriale() {
        return new MaterialeImpl(this); 
    }
    
    public Materiale createMateriale(ResultSet rs) throws DataLayerException {
        try {
            
            MaterialeImpl m = new MaterialeImpl(this); 
            
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setDescrizione(rs.getString("descrizione"));
            m.setDimensione(rs.getString("dimensione"));
            m.setPercorso(rs.getString("percorso"));
            
            return m; 
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to create Materiale object from ResultSet", ex); 
        }
    }
    
    @Override
    public Utente getUtente(int utente_key) throws DataLayerException {
        
        try {
            sUtenteById.setInt(1, utente_key);
            try(ResultSet rs = sUtenteById.executeQuery()){
                
                if(rs.next()){
                    return createUtente(rs); 
                }
                
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Utente by id", ex); 
        }
        
        return null; 
    }
    
    @Override
    public Utente getUtente(String utente_email) throws DataLayerException {
        
        try {
            sUtenteByEmail.setString(1, utente_email);
            try(ResultSet rs = sUtenteByEmail.executeQuery()){
                
                if(rs.next()){
                    return createUtente(rs); 
                }
                
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Utente by email", ex); 
        }
        
        return null; 
    }
    
    @Override
    public List<Utente> getUtenti() throws DataLayerException {
        List<Utente> result = new ArrayList(); 
        
        try(ResultSet rs = sUtente.executeQuery()) {
            
            while(rs.next()){
                result.add(getUtente(rs.getInt("id")));
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Utente", ex); 
        }
            
        return result; 
        
    }
    
    @Override
    public Utente getDocente(int docente_key) throws DataLayerException {
        
        try {
            sDocenteById.setInt(1, docente_key);
            try(ResultSet rs = sDocenteById.executeQuery()){
                
                if(rs.next()){
                    return createUtente(rs); 
                }
                
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Utente docente by id", ex); 
        }
        
        return null; 
    }
    
    @Override
    public Utente getDocente(String docente_email) throws DataLayerException {
        
        try {
            sDocenteByEmail.setString(1, docente_email);
            try(ResultSet rs = sDocenteByEmail.executeQuery()){
                
                if(rs.next()){
                    return createUtente(rs); 
                }
                
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Utente docente by email", ex); 
        }
        
        return null; 
    }
    
    @Override
    public List<Utente> getDocenti() throws DataLayerException {
        List<Utente> result = new ArrayList(); 
        
        try(ResultSet rs = sDocenti.executeQuery()) {
            
            while(rs.next()){
                result.add(getUtente(rs.getInt("id")));
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Utente docente", ex); 
        }
            
        return result; 
        
    }
    
    
}
