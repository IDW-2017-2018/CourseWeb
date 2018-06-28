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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author valen
 */
public class CourseWebDataLayerMySqlImpl extends DataLayerMySqlImpl implements CourseWebDataLayer {
    
    //TODO : filterByLang rivedere cicli
    
    private PreparedStatement sCorso, sCorsoByIdLang, sCorsoByCodice, sCorsoByAnno, sCorsoByNome, sCorsoByNomeNonLike, sCorsoByNomeVersioni, sCorsoByCodiceAnnoLang, uCorsoById, iCorso;
    private PreparedStatement sInfoCorsiByIdCorsoLang, uInfoCorsiById, iInfoCorso;
    private PreparedStatement sUtente, sUtenteById, sUtenteByEmail, uUtenteById, uUtenteByEmail, iUtente, sUtenteByEmailLike;
    private PreparedStatement sCorsoLaurea, sCorsoLaureaById, sCorsoLaureaByNome;
    private PreparedStatement sLibriTesto, sLibroTestoById, iLibroTesto, uLibroTesto;
    private PreparedStatement sMateriali, sMaterialeById, iMateriale, uMateriale, dMateriale;
    
    private PreparedStatement sDocenti, sDocenteById, sDocenteByEmail, sDocentiCorso;
    private PreparedStatement sCorsiLaureaCorso;
    private PreparedStatement sCorsiPropedeuticiCorso;
    private PreparedStatement sCorsiMutuatiCorso;
    private PreparedStatement sModuliCorso;
    private PreparedStatement sLibriTestoCorso;
    private PreparedStatement sMaterialiCorso;
    private PreparedStatement sCFUCorsoCorsoLaurea;
   
    private PreparedStatement iCorsiModuli, iCorsiCorsiMutuati, iCorsiCorsiPropedeutici, iCorsiCorsiLaurea, iCorsiDocenti, iCorsiLibriTesto, iCorsiMateriali;
    private PreparedStatement uCorsiModuli, uCorsiCorsiMutuati, uCorsiCorsiPropedeutici, uCorsiCorsiLaurea, uCorsiDocenti;
    private PreparedStatement sCorsiModuli, sCorsiCorsiMutuati, sCorsiCorsiPropedeutici, sCorsiCorsiLaurea, sCorsiDocenti, sCorsiLibriTesto, sCorsiMateriali;;
    private PreparedStatement dCorsiModuli, dCorsiCorsiMutuati, dCorsiCorsiPropedeutici, dCorsiCorsiLaurea, dCorsiDocenti, dCorsiLibriTesto, dCorsiMateriali;
    
    private PreparedStatement iLogMessage, sLogMessage;
    
    public CourseWebDataLayerMySqlImpl(DataSource datasource) throws SQLException, NamingException {
        super(datasource);
    }
    
    @Override
    public void init() throws DataLayerException{
        try  {
            super.init();
            // precompilo le query
            
            
            sCorso = connection.prepareStatement("SELECT * FROM corsi INNER JOIN info_corsi ON (corsi.id = info_corsi.id_corso)");
            sCorsoByIdLang = connection.prepareStatement("SELECT * FROM corsi INNER JOIN info_corsi ON (corsi.id = info_corsi.id_corso) WHERE corsi.id=? AND info_corsi.lang=?");
            sCorsoByCodice = connection.prepareStatement("SELECT * FROM corsi INNER JOIN info_corsi ON (corsi.id = info_corsi.id_corso) WHERE corsi.codice=?");
            sCorsoByAnno = connection.prepareStatement("SELECT * FROM corsi INNER JOIN info_corsi ON (corsi.id = info_corsi.id_corso) WHERE corsi.anno=?");
            sCorsoByNome = connection.prepareStatement("SELECT * FROM corsi INNER JOIN info_corsi ON (corsi.id = info_corsi.id_corso) WHERE corsi.nome LIKE ?");
            sCorsoByNomeNonLike = connection.prepareStatement("SELECT * FROM corsi INNER JOIN info_corsi ON (corsi.id = info_corsi.id_corso) WHERE corsi.nome=?");
            sCorsoByNomeVersioni = connection.prepareStatement("SELECT * FROM corsi INNER JOIN info_corsi ON (corsi.id = info_corsi.id_corso) WHERE corsi.nome=?");
            sCorsoByCodiceAnnoLang = connection.prepareStatement("SELECT * FROM corsi INNER JOIN info_corsi ON (corsi.id = info_corsi.id_corso) WHERE corsi.codice=? AND corsi.anno=? AND info_corsi.lang=?");
            
            
            uCorsoById = connection.prepareStatement("UPDATE corsi SET codice=?, ssd=?, semestre=?, lingua=?, link_homepage=?, link_risorse=?, link_forum=? WHERE id=?");
            uInfoCorsiById = connection.prepareStatement("UPDATE info_corsi SET prerequisiti=?, obiettivi=?, mod_esame=?, mod_insegnamento=?, descrittori_dublino=?, sillabo=?, note=? WHERE id=?");
            
            sInfoCorsiByIdCorsoLang = connection.prepareStatement("SELECT * FROM info_corsi WHERE id_corso=? AND lang=?");
            
            iCorso = connection.prepareStatement("INSERT INTO corsi (codice,anno,nome,ssd,semestre,lingua,link_homepage,link_risorse,link_forum) VALUES(?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            iInfoCorso = connection.prepareStatement("INSERT INTO info_corsi (prerequisiti,obiettivi,mod_esame,mod_insegnamento,descrittori_dublino,sillabo,note,lang,id_corso) VALUES(?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
            sUtente = connection.prepareStatement("SELECT * FROM utenti");
            sUtenteById = connection.prepareStatement("SELECT * FROM utenti WHERE id=?");
            sUtenteByEmail = connection.prepareStatement("SELECT * FROM utenti WHERE email=?");
            sUtenteByEmailLike = connection.prepareStatement("SELECT * FROM utenti WHERE utenti.email LIKE ?");
            uUtenteById = connection.prepareStatement("UPDATE utenti SET email=?, password=?, nome=?, cognome=?, tipo_utente=? WHERE id=?");
            uUtenteByEmail = connection.prepareStatement("UPDATE utenti SET email=?, password=?, nome=?, cognome=? WHERE email=?");
            iUtente = connection.prepareStatement("INSERT INTO utenti (email,password,tipo_utente,nome,cognome) VALUES(?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
            sCorsoLaurea = connection.prepareStatement("SELECT * FROM corsi_laurea");
            sCorsoLaureaById = connection.prepareStatement("SELECT * FROM corsi_laurea WHERE id=?");
            sCorsoLaureaByNome = connection.prepareStatement("SELECT * FROM corsi_laurea WHERE nome=?");
            
            sLibroTestoById = connection.prepareStatement("SELECT * FROM libri_testo WHERE id=?");
            sLibriTesto = connection.prepareStatement("SELECT * FROM libri_testo");
            iLibroTesto = connection.prepareStatement("INSERT INTO libri_testo (autore, titolo, volume, anno, editore, link) VALUES (?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            uLibroTesto = connection.prepareStatement("UPDATE libri_testo SET autore=?, titolo=?, volume=?, anno=?, editore=?, link=? WHERE id=?");
            
            sMaterialeById = connection.prepareStatement("SELECT * FROM materiali WHERE id=?");
            sMateriali = connection.prepareStatement("SELECT * FROM materiali");
            iMateriale = connection.prepareStatement("INSERT INTO materiali (nome, descrizione, dimensione, percorso, id_utente) VALUES (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            uMateriale = connection.prepareStatement("UPDATE materiali SET nome=?, descrizione=?, dimensione=?, percorso=?, id_utente=? WHERE id=?");
            dMateriale = connection.prepareStatement("DELETE FROM materiali WHERE id=?");
                    
            //query complesse
            sDocenti = connection.prepareStatement("SELECT * FROM utenti WHERE tipo_utente='docente'");
            sDocenteById = connection.prepareStatement("SELECT * FROM utenti WHERE tipo_utente='docente' AND id=?");
            sDocenteByEmail = connection.prepareStatement("SELECT * FROM utenti WHERE tipo_utente='docente' AND email=?");
            
            sCorsiLaureaCorso = connection.prepareStatement("SELECT * FROM corsi_corsi_laurea INNER JOIN corsi_laurea ON (corsi_corsi_laurea.id_corso_laurea = corsi_laurea.id) WHERE corsi_corsi_laurea.id_corso=?");  
            sCorsiPropedeuticiCorso = connection.prepareStatement("SELECT * FROM corsi_corsi_propedeutici INNER JOIN corsi ON (corsi_corsi_propedeutici.id_corso_propedeutico = corsi.id) WHERE corsi_corsi_propedeutici.id_corso=?");
            sCorsiMutuatiCorso = connection.prepareStatement("SELECT * FROM corsi_corsi_mutuati INNER JOIN corsi ON (corsi_corsi_mutuati.id_corso_mutuato = corsi.id) WHERE corsi_corsi_mutuati.id_corso=?");
            sModuliCorso = connection.prepareStatement("SELECT * FROM corsi_moduli INNER JOIN corsi ON (corsi_moduli.id_modulo = corsi.id) WHERE corsi_moduli.id_corso_integrato=?");
            
            sLibriTestoCorso = connection.prepareStatement("SELECT * FROM corsi_libri_testo INNER JOIN libri_testo ON (corsi_libri_testo.id_libro_testo = libri_testo.id) WHERE corsi_libri_testo.id_corso=?");
            sMaterialiCorso = connection.prepareStatement("SELECT * FROM corsi_materiali INNER JOIN materiali ON (corsi_materiali.id_materiale = materiali.id) WHERE corsi_materiali.id_corso=?");
            sDocentiCorso = connection.prepareStatement("SELECT * FROM corsi_docenti INNER JOIN utenti ON (corsi_docenti.id_docente = utenti.id) WHERE corsi_docenti.id_corso=?");
            sCFUCorsoCorsoLaurea = connection.prepareStatement("SELECT * FROM corsi_corsi_laurea WHERE id_corso=? AND id_corso_laurea=?");
            sLogMessage = connection.prepareStatement("SELECT * FROM log");
            
            // INSERT SULLE RELAZIONI
            iCorsiModuli = connection.prepareStatement("INSERT INTO corsi_moduli (id_modulo, id_corso_integrato) VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
            iCorsiCorsiMutuati = connection.prepareStatement("INSERT INTO corsi_corsi_mutuati (id_corso, id_corso_mutuato) VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
            iCorsiCorsiPropedeutici = connection.prepareStatement("INSERT INTO corsi_corsi_propedeutici (id_corso, id_corso_propedeutico) VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
            iCorsiCorsiLaurea = connection.prepareStatement("INSERT INTO corsi_corsi_laurea (id_corso_laurea, id_corso, numero_cfu, tipo_cfu) VALUES (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            iCorsiDocenti = connection.prepareStatement("INSERT INTO corsi_docenti (id_corso, id_docente) VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
            iCorsiLibriTesto = connection.prepareStatement("INSERT INTO corsi_libri_testo (id_corso, id_libro_testo) VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
            iCorsiMateriali = connection.prepareStatement("INSERT INTO corsi_materiali (id_corso, id_materiale) VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
            iLogMessage = connection.prepareStatement("INSERT INTO log (messaggio) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
            
            // UPDATE SULLE RELAZIONI
            uCorsiModuli = connection.prepareStatement("UPDATE corsi_moduli SET id_corso_integrato=? WHERE id=?");
            uCorsiCorsiMutuati = connection.prepareStatement("UPDATE corsi_corsi_mutuati SET id_corso_mutuato=? WHERE id=?");
            uCorsiCorsiPropedeutici = connection.prepareStatement("UPDATE corsi_corsi_propedeutici SET id_corso_propedeutico=? WHERE id=?");
            uCorsiCorsiLaurea = connection.prepareStatement("UPDATE corsi_corsi_laurea SET id_corso_laurea=?, numero_cfu=?, tipo_cfu=? WHERE id=?");
            uCorsiDocenti = connection.prepareStatement("UPDATE corsi_docenti SET id_docente=? WHERE id=?");
       
            // SELECT NECESSARIE PER UPDATE SU RELAZIONI
            sCorsiModuli = connection.prepareStatement("SELECT * FROM corsi_moduli WHERE id_modulo=? AND id_corso_integrato=?");
            sCorsiCorsiMutuati = connection.prepareStatement("SELECT * FROM corsi_corsi_mutuati WHERE id_corso=? AND id_corso_mutuato=?");
            sCorsiCorsiPropedeutici = connection.prepareStatement("SELECT * FROM corsi_corsi_propedeutici WHERE id_corso=? AND id_corso_propedeutico=?");
            sCorsiCorsiLaurea = connection.prepareStatement("SELECT * FROM corsi_corsi_laurea WHERE id_corso=? AND id_corso_laurea=?");
            sCorsiDocenti = connection.prepareStatement("SELECT * FROM corsi_docenti WHERE id_corso=? AND id_docente=?");
            sCorsiLibriTesto = connection.prepareStatement("SELECT * FROM corsi_libri_testo WHERE id_corso=? AND id_libro_testo=?");
            sCorsiMateriali = connection.prepareStatement("SELECT * FROM  corsi_materiali WHERE id_corso=? AND id_materiale=?");
            
            
            // ELIMINAZIONI SULLE RELAZIONI
            dCorsiModuli = connection.prepareStatement("DELETE FROM corsi_moduli WHERE id=?");
            dCorsiCorsiMutuati = connection.prepareStatement("DELETE FROM corsi_corsi_mutuati WHERE id=?");
            dCorsiCorsiPropedeutici = connection.prepareStatement("DELETE FROM corsi_corsi_propedeutici WHERE id=?");
            dCorsiCorsiLaurea = connection.prepareStatement("DELETE FROM corsi_corsi_laurea WHERE id=?");
            dCorsiDocenti = connection.prepareStatement("DELETE FROM corsi_docenti WHERE id=?");
            dCorsiLibriTesto = connection.prepareStatement("DELETE FROM corsi_libri_testo WHERE id=?");
            dCorsiMateriali = connection.prepareStatement("DELETE FROM corsi_materiali WHERE id=?");
            
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
            
            c.setId(rs.getInt("corsi.id"));
            c.setCodice(rs.getString("corsi.codice"));
            c.setAnno(rs.getString("corsi.anno"));
            c.setNome(rs.getString("corsi.nome"));
            c.setSSD(rs.getString("corsi.SSD"));
            c.setSemestre(rs.getInt("corsi.semestre"));
            c.setLingua(rs.getString("corsi.lingua"));
            c.setPrerequisiti(rs.getString("info_corsi.prerequisiti"));
            c.setObiettivi(rs.getString("info_corsi.obiettivi"));
            c.setModEsame(rs.getString("info_corsi.mod_esame")); 
            c.setModInsegnamento(rs.getString("info_corsi.mod_insegnamento"));
            c.setDescrittoriDublino(rs.getString("info_corsi.descrittori_dublino"));
            c.setSillabo(rs.getString("info_corsi.sillabo")); 
            c.setLinkHomepageCorso(rs.getString("corsi.link_homepage"));
            c.setLinkRisorseEsterne(rs.getString("corsi.link_risorse"));
            c.setLinkForum(rs.getString("corsi.link_forum"));
            c.setNote(rs.getString("info_corsi.note"));
            
            c.setLang(rs.getString("info_corsi.lang"));
            
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
            m.setDimensione(rs.getLong("dimensione"));
            m.setPercorso(rs.getString("percorso"));
            m.setUtenteId(rs.getInt("id_utente"));
            
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
    public List<Utente> getUtenteByEmailLike(String utente_email) throws DataLayerException{
        List<Utente> result = new ArrayList();
          
        try{
            sUtenteByEmailLike.setString(1, "%" + utente_email + "%");
            try(ResultSet rs = sUtenteByEmailLike.executeQuery()) {
                while(rs.next()){
                    result.add(getUtente(rs.getInt("id")));
                }
            }
        }
        catch(SQLException exc){
            throw new DataLayerException("Unable to load Utente by email", exc); 
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
    
    
    @Override
    public Corso getCorso(int corso_key, String lang) throws DataLayerException {
        
        try {
            sCorsoByIdLang.setInt(1, corso_key);
            sCorsoByIdLang.setString(2, lang);
            try(ResultSet rs = sCorsoByIdLang.executeQuery()){
                
                if(rs.next()){
                    return createCorso(rs); 
                }
                
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Corso by id", ex); 
        }
        
        return null; 
    }
    
    @Override
    public List<Corso> getCorso(String corso_codice, String corso_anno, String lang) throws DataLayerException {
        //2 corsi, in base a lang
        
        List<Corso> result = new ArrayList<Corso>(); 
        
        try {
            sCorsoByCodiceAnnoLang.setString(1, corso_codice);
            sCorsoByCodiceAnnoLang.setString(2, corso_anno);
            sCorsoByCodiceAnnoLang.setString(3, lang);
            try(ResultSet rs = sCorsoByCodiceAnnoLang.executeQuery()){
                
                while(rs.next()){
                    result.add(createCorso(rs)); 
                }
                
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Corso by codice & anno", ex); 
        }
        
        if(result.isEmpty())
            return null; 
        else 
            return result; 
        
    }
    
    @Override
    public List<Corso> getCorsoByCodice(String corso_codice) throws DataLayerException {
        List<Corso> result = new ArrayList(); 
        
        try{     
            sCorsoByCodice.setString(1, corso_codice);
            try(ResultSet rs = sCorsoByCodice.executeQuery()) {          
                
                while(rs.next()){
                    result.add(getCorso(rs.getInt("corsi.id"), rs.getString("info_corsi.lang")));
                }
            } 
        }
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Corso by codice", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public List<Corso> getCorsoByAnno(String corso_anno) throws DataLayerException {
        List<Corso> result = new ArrayList(); 
        
        try{     
            sCorsoByAnno.setString(1, corso_anno);
            try(ResultSet rs = sCorsoByAnno.executeQuery()) {          
                
                while(rs.next()){
                    result.add(getCorso(rs.getInt("corsi.id"), rs.getString("info_corsi.lang")));                    
                }
            } 
        }
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Corso by anno", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public List<Corso> getCorsoByNome(String corso_nome) throws DataLayerException{
        List<Corso> result = new ArrayList();
          
        try{
            sCorsoByNome.setString(1, "%" + corso_nome + "%");
            try(ResultSet rs = sCorsoByNome.executeQuery()) {
                while(rs.next()){
                    result.add(getCorso(rs.getInt("corsi.id"), rs.getString("info_corsi.lang")));
                }
            }
        }
        catch(SQLException exc){
            throw new DataLayerException("Unable to load Corso by nome", exc); 
        }
        return result;
    }
    
    @Override
    public List<Corso> getCorsoByNomeNonLike(String corso_nome) throws DataLayerException{
        List<Corso> result = new ArrayList();
          
        try{
            sCorsoByNomeNonLike.setString(1, corso_nome);
            try(ResultSet rs = sCorsoByNomeNonLike.executeQuery()) {
                while(rs.next()){
                    result.add(getCorso(rs.getInt("corsi.id"), rs.getString("info_corsi.lang")));
                }
            }
        }
        catch(SQLException exc){
            throw new DataLayerException("Unable to load Corso by nome", exc); 
        }
        return result;
    }
    
    @Override
    public List<Corso> getCorsoByNomeVersioni(String corso_nome) throws DataLayerException {
        List<Corso> result = new ArrayList();
          
        try{
            sCorsoByNomeVersioni.setString(1, corso_nome);
            try(ResultSet rs = sCorsoByNomeVersioni.executeQuery()) {
                while(rs.next()){
                    result.add(getCorso(rs.getInt("corsi.id"), rs.getString("info_corsi.lang")));
                }
            }
        }
        catch(SQLException exc){
            throw new DataLayerException("Unable to load versioni Corso by nome", exc); 
        }
        return result;
    }
    
    @Override
    public List<Corso> getCorsi() throws DataLayerException {
        List<Corso> result = new ArrayList(); 
                   
        try(ResultSet rs = sCorso.executeQuery()) {          
                
            while(rs.next()){
                result.add(getCorso(rs.getInt("corsi.id"), rs.getString("info_corsi.lang")));
            }
            
        } 
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Corsi", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public List<Corso> getCorsiAggiornati() throws DataLayerException {
        List<Corso> corsi = getCorsi();
        List<Corso> result = new ArrayList<Corso>(); 
                
        for(int i = 0; i < corsi.size(); i++){
            Corso item = corsi.get(i); 
                                   
            for(int j = i + 1; j < (corsi.size() - 1); j++){
                Corso now = corsi.get(j);
                                                 
                if(now.getNome().equals(item.getNome())){
                    //assunzione campo anno tipo "2016/2017" stringa
                                       
                    String anno_1 = item.getAnno().substring(0, item.getAnno().lastIndexOf("/")); //2016
                    String anno_2 = now.getAnno().substring(0, now.getAnno().lastIndexOf("/"));
                                                           
                    if(anno_2.compareTo(anno_1) > 0){
                        item = now; 
                    }
                 
                } 
    
            }
            if(!result.contains(item))
            result.add(item);          
        }       
        return result;             
    }
    
    @Override
    public List<Corso> getCorsiByNomeAggiornati(String corso_nome) throws DataLayerException {
        List<Corso> corsi = getCorsoByNome(corso_nome);                      
        List<Corso> result = new ArrayList<Corso>(); 
        
        for(int i = 0; i < corsi.size(); i++){
            Corso item = corsi.get(i); 
           
            for(int j = i + 1; j < (corsi.size() - 1); j++){
                Corso now = corsi.get(j);
                
                if(now.getNome().equals(item.getNome())){
                    //assunzione campo anno tipo "2016/2017" stringa
                   
                    String anno_1 = item.getAnno().substring(0, item.getAnno().lastIndexOf("/")); //2016
                    String anno_2 = now.getAnno().substring(0, now.getAnno().lastIndexOf("/"));
                    
                    if(anno_2.compareTo(anno_1) > 0){
                        item = now; 
                    }
                 
                }                
                //prosegui ricerca
                            
            }
            if(!result.contains(item))
            result.add(item); 
            }
               
        return result;            
    }
    
    @Override
    public List<Corso> getCorsiByNomeAggiornatiNonLike(String corso_nome) throws DataLayerException {
        List<Corso> corsi = getCorsoByNomeNonLike(corso_nome);                      
        List<Corso> result = new ArrayList<Corso>(); 
        
        for(int i = 0; i < corsi.size(); i++){
            Corso item = corsi.get(i); 
           
            for(int j = i + 1; j < (corsi.size() - 1); j++){
                Corso now = corsi.get(j);
                
                if(now.getNome().equals(item.getNome())){
                    //assunzione campo anno tipo "2016/2017" stringa
                   
                    String anno_1 = item.getAnno().substring(0, item.getAnno().lastIndexOf("/")); //2016
                    String anno_2 = now.getAnno().substring(0, now.getAnno().lastIndexOf("/"));
                    
                    if(anno_2.compareTo(anno_1) > 0){
                        item = now; 
                    }
                 
                }                
                //prosegui ricerca
                            
            }
            if(!result.contains(item))
            result.add(item); 
            }
               
        return result;            
    }
    
    @Override
    public List<Corso> filterCorsiByLang(String lang, List<Corso> lista_corsi){       
        List<Corso> result = new ArrayList<Corso>();        
        if(lang == null)
            return result;         
        for(int i = 0; i < lista_corsi.size(); i++){
            if(lista_corsi.get(i).getLang().equals(lang)) result.add(lista_corsi.get(i)); 
        }        
        return result; 
    }
    
    @Override
    public Corso_Laurea getCorsoLaurea(int corso_laurea_key) throws DataLayerException {
        
        try {
            sCorsoLaureaById.setInt(1, corso_laurea_key);
            try(ResultSet rs = sCorsoLaureaById.executeQuery()){
                
                if(rs.next()){
                    return createCorsoLaurea(rs); 
                }
                
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Corso_Laurea by id", ex); 
        }
        
        return null; 
    }
    
    @Override
    public Corso_Laurea getCorsoLaurea(String corso_laurea_nome) throws DataLayerException {
        
        try {
            sCorsoLaureaByNome.setString(1, corso_laurea_nome);
            try(ResultSet rs = sCorsoLaureaByNome.executeQuery()){
                
                if(rs.next()){
                    return createCorsoLaurea(rs); 
                }
                
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Corso_Laurea by nome", ex); 
        }
        
        return null; 
    }
    
    @Override
    public List<Corso_Laurea> getCorsiLaurea() throws DataLayerException {
        List<Corso_Laurea> result = new ArrayList(); 
                   
        try(ResultSet rs = sCorsoLaurea.executeQuery()) {          
                
            while(rs.next()){
                result.add(getCorsoLaurea(rs.getInt("id")));
            }
            
        } 
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Corsi_Laurea", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public Libro_Testo getLibroTesto(int libro_testo_key) throws DataLayerException {
        
        try {
            sLibroTestoById.setInt(1, libro_testo_key);
            try(ResultSet rs = sLibroTestoById.executeQuery()){
                
                if(rs.next()){
                    return createLibroTesto(rs); 
                }
                
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Libro_Testo by id", ex); 
        }
        
        return null; 
    }
    
    @Override
    public List<Libro_Testo> getLibriTesto() throws DataLayerException {
        List<Libro_Testo> result = new ArrayList(); 
                   
        try(ResultSet rs = sLibriTesto.executeQuery()) {          
                
            while(rs.next()){
                result.add(getLibroTesto(rs.getInt("id")));
            }
            
        } 
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Libri_Testo", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public Materiale getMateriale(int materiale_key) throws DataLayerException {
        
        try {
            sMaterialeById.setInt(1, materiale_key);
            try(ResultSet rs = sMaterialeById.executeQuery()){
                
                if(rs.next()){
                    return createMateriale(rs); 
                }
                
            }
            
        } catch(SQLException ex){
            throw new DataLayerException("Unable to load Materiale by id", ex); 
        }
        
        return null; 
    }
    
    @Override
    public List<Materiale> getMateriali() throws DataLayerException {
        List<Materiale> result = new ArrayList(); 
                   
        try(ResultSet rs = sMateriali.executeQuery()) {          
                
            while(rs.next()){
                result.add(getMateriale(rs.getInt("id")));
            }
            
        } 
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Materiali", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public List<Corso_Laurea> getCorsiLaureaCorso(Corso corso) throws DataLayerException {
        List<Corso_Laurea> result = new ArrayList(); 
        
        try{     
            sCorsiLaureaCorso.setInt(1, corso.getId());
            try(ResultSet rs = sCorsiLaureaCorso.executeQuery()) {          
                
                while(rs.next()){
                    result.add(getCorsoLaurea(rs.getInt("corsi_laurea.id")));
                }
            } 
        }
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Corsi_Laurea by Corso", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public List<Corso> getCorsiPropedeuticiCorso(Corso corso) throws DataLayerException {
        List<Corso> result = new ArrayList(); 
        
        try{     
            sCorsiPropedeuticiCorso.setInt(1, corso.getId());
            try(ResultSet rs = sCorsiPropedeuticiCorso.executeQuery()) {          
                
                while(rs.next()){
                    
                    Corso corso_ita = getCorso(rs.getInt("corsi.id"), "ita");
                    
                    if(corso_ita != null)
                        result.add(corso_ita);
                    
                }
                
            } 
        }
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Corsi Propedeutici by Corso", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public List<Corso> getCorsiMutuatiCorso(Corso corso) throws DataLayerException {
        List<Corso> result = new ArrayList(); 
        
        try{     
            sCorsiMutuatiCorso.setInt(1, corso.getId());
            try(ResultSet rs = sCorsiMutuatiCorso.executeQuery()) {          
                
                while(rs.next()){
                    Corso corso_ita = getCorso(rs.getInt("corsi.id"), "ita");
                    
                    if(corso_ita != null)
                        result.add(corso_ita);
                    
                }
            } 
        }
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Corsi Mutuati by Corso", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public List<Corso> getModuliCorso(Corso corso) throws DataLayerException {
        List<Corso> result = new ArrayList(); 
        
        try{     
            sModuliCorso.setInt(1, corso.getId());
            try(ResultSet rs = sModuliCorso.executeQuery()) {          
                
                while(rs.next()){
                    Corso corso_ita = getCorso(rs.getInt("corsi.id"), "ita");                    
                    
                    if(corso_ita != null)
                        result.add(corso_ita);
                    
                }
            } 
        }
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Corsi Integrati by Corso", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public List<Libro_Testo> getLibriTestoCorso(Corso corso) throws DataLayerException {
        List<Libro_Testo> result = new ArrayList(); 
        
        try{     
            sLibriTestoCorso.setInt(1, corso.getId());
            try(ResultSet rs = sLibriTestoCorso.executeQuery()) {          
                
                while(rs.next()){
                    result.add(getLibroTesto(rs.getInt("libri_testo.id")));
                }
            } 
        }
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Libri_Testo by Corso", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public List<Materiale> getMaterialiCorso(Corso corso) throws DataLayerException {
        List<Materiale> result = new ArrayList(); 
        
        try{     
            sMaterialiCorso.setInt(1, corso.getId());
            try(ResultSet rs = sMaterialiCorso.executeQuery()) {          
                
                while(rs.next()){
                    result.add(getMateriale(rs.getInt("materiali.id")));
                }
            } 
        }
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Materiali by Corso", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public List<Utente> getDocentiCorso(Corso corso) throws DataLayerException {
        List<Utente> result = new ArrayList(); 
        
        try{     
            sDocentiCorso.setInt(1, corso.getId());
            try(ResultSet rs = sDocentiCorso.executeQuery()) {          
                
                while(rs.next()){
                    result.add(getUtente(rs.getInt("utenti.id")));
                }
            } 
        }
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Docenti by Corso", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public void storeUtenteById(Utente utente) throws DataLayerException {
    
        int key = utente.getId();
        try {
            
            if(utente.getId() > 0) { //update
                if(!utente.isDirty()) {
                    return;
                }
            uUtenteById.setString(1, utente.getEmail().trim());
            uUtenteById.setString(2, utente.getPassword());
            uUtenteById.setString(3, utente.getNome().trim());
            uUtenteById.setString(4, utente.getCognome().trim());
            uUtenteById.setString(5, utente.getTipoUtente());
            uUtenteById.setInt(6, utente.getId());
            uUtenteById.executeUpdate();
            }
            else { //insert
                iUtente.setString(1, utente.getEmail().trim());
                iUtente.setString(2, utente.getPassword());
                iUtente.setString(3, utente.getTipoUtente().trim());
                iUtente.setString(4, utente.getNome().trim());
                iUtente.setString(5, utente.getCognome().trim());
                
                if(iUtente.executeUpdate() == 1) {
                    
                    try(ResultSet keys = iUtente.getGeneratedKeys()) {
                        if(keys.next()) {
                            key = keys.getInt(1);
                        }
                    }
                    
                }
            }
            if(key > 0) {
                utente.copyFrom(getUtente(key));
                
            }
            utente.setDirty(false);
        }
        catch(SQLException ex) {
            throw new DataLayerException("Unable to store Utente by id", ex);
        }
        
    }
    
    @Override
    public void storeUtenteByEmail(Utente utente) throws DataLayerException {
    
        int key = utente.getId();
        try {
            
            if(utente.getId() > 0) { //update
                if(!utente.isDirty()) {
                    return;
                }
            uUtenteByEmail.setString(1, utente.getEmail().trim());
            uUtenteByEmail.setString(2, utente.getPassword());
            uUtenteByEmail.setString(3, utente.getNome().trim());
            uUtenteByEmail.setString(4, utente.getCognome().trim());
            uUtenteByEmail.setString(5, utente.getEmail().trim());
            uUtenteByEmail.executeUpdate();
            }
            else { //insert
                iUtente.setString(1, utente.getEmail().trim());
                iUtente.setString(2, utente.getPassword());
                iUtente.setString(3, utente.getTipoUtente().trim());
                iUtente.setString(4, utente.getNome().trim());
                iUtente.setString(5, utente.getCognome().trim());
            
                if(iUtente.executeUpdate() == 1) {
                    
                    try(ResultSet keys = iUtente.getGeneratedKeys()) {
                        if(keys.next()) {
                            key = keys.getInt(1);
                        }
                    }
                    
                }
            }
            if(key > 0) {
                utente.copyFrom(getUtente(key));
            }
            utente.setDirty(false);
        }
        catch(SQLException ex) {
            throw new DataLayerException("Unable to store Utente by email", ex);
        }
        
    }
    
    @Override
    public void storeCorso(Corso corso) throws DataLayerException {
    
        int key = corso.getId();
        try {
            
            if(corso.getId() > 0) { //update
                if(!corso.isDirty()) {
                    return;
                }
            
            //update su corsi
            uCorsoById.setString(1, corso.getCodice().trim());                          
            uCorsoById.setString(2, corso.getSSD().trim());
            uCorsoById.setInt(3, corso.getSemestre());
            uCorsoById.setString(4, corso.getLingua());
            uCorsoById.setString(5, corso.getLinkHomepageCorso());
            uCorsoById.setString(6, corso.getLinkRisorseEsterne());
            uCorsoById.setString(7, corso.getLinkForum());
            
            uCorsoById.setInt(8, corso.getId());
            
            uCorsoById.executeUpdate();
            
            //update su info_corsi
            int info_corsi_key = 0;
            sInfoCorsiByIdCorsoLang.setInt(1, corso.getId());
            sInfoCorsiByIdCorsoLang.setString(2, corso.getLang());
            try(ResultSet rs = sInfoCorsiByIdCorsoLang.executeQuery()) {          

                if(rs.next()){
                    info_corsi_key = rs.getInt("id");
                }

            } 
            
            if(info_corsi_key == 0)
                throw new DataLayerException("Unable to store in InfoCorso");
            
            uInfoCorsiById.setString(1, corso.getPrerequisiti());
            uInfoCorsiById.setString(2, corso.getObiettivi());
            uInfoCorsiById.setString(3, corso.getModEsame());
            uInfoCorsiById.setString(4, corso.getModInsegnamento());
            uInfoCorsiById.setString(5, corso.getDescrittoriDublino());
            uInfoCorsiById.setString(6, corso.getSillabo());            
            uInfoCorsiById.setString(7, corso.getNote());
            
            uInfoCorsiById.setInt(8, info_corsi_key);
                           
            uInfoCorsiById.executeUpdate();
            }
            else { //insert
                iCorso.setString(1, corso.getCodice().trim());
                iCorso.setString(2, corso.getAnno());
                iCorso.setString(3, corso.getNome());
                iCorso.setString(4, corso.getSSD().trim());
                iCorso.setInt(5, corso.getSemestre());
                iCorso.setString(6, corso.getLingua());
                iCorso.setString(7, corso.getLinkHomepageCorso());
                iCorso.setString(8, corso.getLinkRisorseEsterne());
                iCorso.setString(9, corso.getLinkForum());
                
                if(iCorso.executeUpdate() == 1) {
                    
                    try(ResultSet keys = iCorso.getGeneratedKeys()) {
                        if(keys.next()) {
                            key = keys.getInt(1);
                        }
                    }
                }
            }
            if(key > 0) {
                
                if(corso.getLang().equals("")){
                    corso.setId(key);
                    corso.setDirty(false);
                }
                
                else{
                    corso.copyFrom(getCorso(key, corso.getLang()));
                }
            }
            corso.setDirty(false);
        }
        catch(SQLException ex) {
            throw new DataLayerException("Unable to store Corso by id", ex);
        }
        
    }
    
    @Override
    public void storeInfoCorso(Corso corso) throws DataLayerException {
        
        int key = corso.getId();
        try {
                
                iInfoCorso.setString(1, corso.getPrerequisiti());
                iInfoCorso.setString(2, corso.getObiettivi());
                iInfoCorso.setString(3, corso.getModEsame());
                iInfoCorso.setString(4, corso.getModInsegnamento());
                iInfoCorso.setString(5, corso.getDescrittoriDublino());
                iInfoCorso.setString(6, corso.getSillabo());                
                iInfoCorso.setString(7, corso.getNote());
                iInfoCorso.setString(8, corso.getLang());
                                    
                iInfoCorso.setInt(9, key);
                iInfoCorso.executeUpdate();
            
        }
        catch(SQLException ex) {
            throw new DataLayerException("Unable to store InfoCorso by id", ex);
        }
        
    }
    
    @Override
    public void storeMateriale(Materiale materiale, int utente_key) throws DataLayerException {
    
        int key = materiale.getId();
        try {
            
            if(materiale.getId() > 0) { //update
                if(!materiale.isDirty()) {
                    return;
                }
            uMateriale.setString(1, materiale.getNome());
            uMateriale.setString(2, materiale.getDescrizione());
            uMateriale.setLong(3, materiale.getDimensione());
            uMateriale.setString(4, materiale.getPercorso());
            uMateriale.setInt(5, utente_key);
            uMateriale.setInt(6, materiale.getId());
            uMateriale.executeUpdate();
            }
            else { //insert
                iMateriale.setString(1, materiale.getNome());
                iMateriale.setString(2, materiale.getDescrizione());
                iMateriale.setLong(3, materiale.getDimensione());
                iMateriale.setString(4, materiale.getPercorso());
                iMateriale.setInt(5, utente_key);               
                
                if(iMateriale.executeUpdate() == 1) {
                    
                    try(ResultSet keys = iMateriale.getGeneratedKeys()) {
                        if(keys.next()) {
                            key = keys.getInt(1);
                        }
                    }
                    
                }
            }
            if(key > 0) {
                materiale.copyFrom(getMateriale(key));
            }
            materiale.setDirty(false);
        }
        catch(SQLException ex) {
            throw new DataLayerException("Unable to store Materiale", ex);
        }
        
    }
    
    @Override
    public void storeLibroTesto(Libro_Testo libro_testo) throws DataLayerException {
    
        int key = libro_testo.getId();
        try {
            
            if(libro_testo.getId() > 0) { //update
                if(!libro_testo.isDirty()) {
                    return;
                }
            uLibroTesto.setString(1, libro_testo.getAutore());
            uLibroTesto.setString(2, libro_testo.getTitolo());
            uLibroTesto.setString(3, libro_testo.getVolume());
            uLibroTesto.setString(4, libro_testo.getAnno());
            uLibroTesto.setString(5, libro_testo.getEditore());
            uLibroTesto.setString(6, libro_testo.getLink());
            uLibroTesto.setInt(7, libro_testo.getId());
            uLibroTesto.executeUpdate();
            }
            else { //insert
                iLibroTesto.setString(1, libro_testo.getAutore());
                iLibroTesto.setString(2, libro_testo.getTitolo());
                iLibroTesto.setString(3, libro_testo.getVolume());
                iLibroTesto.setString(4, libro_testo.getAnno());
                iLibroTesto.setString(5, libro_testo.getEditore());
                iLibroTesto.setString(6, libro_testo.getLink());
                
                if(iLibroTesto.executeUpdate() == 1) {
                    
                    try(ResultSet keys = iLibroTesto.getGeneratedKeys()) {
                        if(keys.next()) {
                            key = keys.getInt(1);
                        }
                    }
                    
                }
            }
            if(key > 0) {
                libro_testo.copyFrom(getLibroTesto(key));
            }
            libro_testo.setDirty(false);
        }
        catch(SQLException ex) {
            throw new DataLayerException("Unable to store Libro_Testo", ex);
        }
        
    }
    
    @Override
    public void storeCorsiModuli(int modulo_key, int corso_integrato_key) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiModuli.setInt(1, modulo_key); 
            sCorsiModuli.setInt(2, corso_integrato_key); 
            try(ResultSet rs = sCorsiModuli.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //update or insert
            if(key > 0){
                //update
                uCorsiModuli.setInt(1, corso_integrato_key);
                uCorsiModuli.setInt(2, key);
                
                uCorsiModuli.executeUpdate();
                
            } else {
                //insert
                iCorsiModuli.setInt(1, modulo_key);
                iCorsiModuli.setInt(2, corso_integrato_key);

                iCorsiModuli.executeUpdate();
                
            }
          
        } catch(SQLException e){
            throw new DataLayerException("Unable to store in relation CorsiModuli", e);
        }
        
    }
    
    @Override
    public void storeCorsiCorsiMutuati(int corso_key, int corso_mutuato_key) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiCorsiMutuati.setInt(1, corso_key); 
            sCorsiCorsiMutuati.setInt(2, corso_mutuato_key); 
            try(ResultSet rs = sCorsiCorsiMutuati.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //update or insert
            if(key > 0){
                //update
                uCorsiCorsiMutuati.setInt(1, corso_mutuato_key);
                uCorsiCorsiMutuati.setInt(2, key);
                
                uCorsiCorsiMutuati.executeUpdate();
                
            } else {
                //insert
                iCorsiCorsiMutuati.setInt(1, corso_key);
                iCorsiCorsiMutuati.setInt(2, corso_mutuato_key);

                iCorsiCorsiMutuati.executeUpdate();
                
            }
            
        } catch(SQLException e){
            throw new DataLayerException("Unable to store in relation CorsiCorsiMutuati", e);
        }
        
    }
    
    @Override
    public void storeCorsiCorsiPropedeutici(int corso_key, int corso_propedeutico_key) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiCorsiPropedeutici.setInt(1, corso_key); 
            sCorsiCorsiPropedeutici.setInt(2, corso_propedeutico_key); 
            try(ResultSet rs = sCorsiCorsiPropedeutici.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //update or insert
            if(key > 0){
                //update
                uCorsiCorsiPropedeutici.setInt(1, corso_propedeutico_key);
                uCorsiCorsiPropedeutici.setInt(2, key);
                
                uCorsiCorsiPropedeutici.executeUpdate();
                
            } else {
                //insert
                iCorsiCorsiPropedeutici.setInt(1, corso_key);
                iCorsiCorsiPropedeutici.setInt(2, corso_propedeutico_key);

                iCorsiCorsiPropedeutici.executeUpdate();
                
            }
            
        } catch(SQLException e){
            throw new DataLayerException("Unable to store in relation CorsiCorsiPropedeutici", e);
        }
        
    }
    
    @Override
    public void storeCorsiCorsiLaurea(int corso_laurea_key, int corso_key, String numero_cfu, String tipo_cfu) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiCorsiLaurea.setInt(1, corso_key); 
            sCorsiCorsiLaurea.setInt(2, corso_laurea_key); 
            try(ResultSet rs = sCorsiCorsiLaurea.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //update or insert
            if(key > 0){
                //update
                uCorsiCorsiLaurea.setInt(1, corso_laurea_key);
                uCorsiCorsiLaurea.setString(2, numero_cfu);
                uCorsiCorsiLaurea.setString(3, tipo_cfu);
                uCorsiCorsiLaurea.setInt(4, key);
                uCorsiCorsiLaurea.executeUpdate();
                
            } else {
                //insert
                iCorsiCorsiLaurea.setInt(1, corso_laurea_key);
                iCorsiCorsiLaurea.setInt(2, corso_key);
                iCorsiCorsiLaurea.setString(3, numero_cfu);
                iCorsiCorsiLaurea.setString(4, tipo_cfu);

                iCorsiCorsiLaurea.executeUpdate();
                
            }
            
        } catch(SQLException e){
            throw new DataLayerException("Unable to store in relation CorsiCorsiLaurea", e);
        }
        
    }
    
    @Override
    public void storeCorsiDocenti(int corso_key, int docente_key) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiDocenti.setInt(1, corso_key); 
            sCorsiDocenti.setInt(2, docente_key); 
            try(ResultSet rs = sCorsiDocenti.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //update or insert
            if(key > 0){
                //update
                uCorsiDocenti.setInt(1, docente_key);
                uCorsiDocenti.setInt(2, key);
                
                uCorsiDocenti.executeUpdate();
                
            } else {
                //insert
                iCorsiDocenti.setInt(1, corso_key);
                iCorsiDocenti.setInt(2, docente_key);

                iCorsiDocenti.executeUpdate();
                
            }
                                 
        } catch(SQLException e){
            throw new DataLayerException("Unable to store in relation CorsiDocenti", e);
        }
        
    }
    
    @Override
    public void storeCorsiLibriTesto(int corso_key, int libro_testo_key) throws DataLayerException {
        
        try {
            
            iCorsiLibriTesto.setInt(1, corso_key);
            iCorsiLibriTesto.setInt(2, libro_testo_key);
            
            iCorsiLibriTesto.executeUpdate();
            
        } catch(SQLException e){
            throw new DataLayerException("Unable to store in relation CorsiLibriTesto", e);
        }
        
    }
    
    @Override
    public void storeCorsiMateriali(int corso_key, int materiale_key) throws DataLayerException {
        
        try {
            
            iCorsiMateriali.setInt(1, corso_key);
            iCorsiMateriali.setInt(2, materiale_key);
            
            iCorsiMateriali.executeUpdate();
            
        } catch(SQLException e){
            throw new DataLayerException("Unable to store in relation CorsiMateriali", e);
        }
        
    }
    
    @Override
    public void deleteCorsiModuli(int corso_integrato_key, int modulo_key) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiModuli.setInt(1, modulo_key); 
            sCorsiModuli.setInt(2, corso_integrato_key); 
            try(ResultSet rs = sCorsiModuli.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //riga già presente, delete possibile
            if(key > 0){
                //delete
                dCorsiModuli.setInt(1, key);
                
                dCorsiModuli.executeUpdate();
                
            } else {
                throw new DataLayerException("Unable to delete in CorsiModuli, no such row");
            }
          
        } catch(SQLException e){
            throw new DataLayerException("Unable to delete in relation CorsiModuli", e);
        }
        
    }
    
    @Override
    public void deleteCorsiCorsiMutuati(int corso_key, int corso_mutuato_key) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiCorsiMutuati.setInt(1, corso_key); 
            sCorsiCorsiMutuati.setInt(2, corso_mutuato_key); 
            try(ResultSet rs = sCorsiCorsiMutuati.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //delete se possibile
            if(key > 0){
                //delete
                dCorsiCorsiMutuati.setInt(1, key);
                
                dCorsiCorsiMutuati.executeUpdate();
                
            } else {
                throw new DataLayerException("Unable to delete in relation CorsiCorsiMutuati, no such row");
            }
            
        } catch(SQLException e){
            throw new DataLayerException("Unable to delete in relation CorsiCorsiMutuati", e);
        }
        
    }
    
    @Override
    public void deleteCorsiCorsiPropedeutici(int corso_key, int corso_propedeutico_key) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiCorsiPropedeutici.setInt(1, corso_key); 
            sCorsiCorsiPropedeutici.setInt(2, corso_propedeutico_key); 
            try(ResultSet rs = sCorsiCorsiPropedeutici.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //delete or insert
            if(key > 0){
                //delete
                dCorsiCorsiPropedeutici.setInt(1, key);
                
                dCorsiCorsiPropedeutici.executeUpdate();
                
            } else {
                throw new DataLayerException("Unable to delete in relation CorsiCorsiPropedeutici, no such row");
            }
            
        } catch(SQLException e){
            throw new DataLayerException("Unable to delete in relation CorsiCorsiPropedeutici", e);
        }
        
    }
    
    @Override
    public void deleteCorsiCorsiLaurea(int corso_key, int corso_laurea_key) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiCorsiLaurea.setInt(1, corso_key); 
            sCorsiCorsiLaurea.setInt(2, corso_laurea_key); 
            try(ResultSet rs = sCorsiCorsiLaurea.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //delete or insert
            if(key > 0){
                //delete                
                dCorsiCorsiLaurea.setInt(1, key);
                
                dCorsiCorsiLaurea.executeUpdate();
                
            } else {
                throw new DataLayerException("Unable to delete in relation CorsiCorsiLaurea, no such row");
            }
            
        } catch(SQLException e){
            throw new DataLayerException("Unable to delete in relation CorsiCorsiLaurea", e);
        }
        
    }
    
    @Override
    public void deleteCorsiDocenti(int corso_key, int docente_key) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiDocenti.setInt(1, corso_key); 
            sCorsiDocenti.setInt(2, docente_key); 
            try(ResultSet rs = sCorsiDocenti.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //delete or insert
            if(key > 0){
                //delete
                dCorsiDocenti.setInt(1, key);
                
                dCorsiDocenti.executeUpdate();
                
            } else {
                throw new DataLayerException("Unable to delete in relation CorsiDocenti, no such row");
            }
                                 
        } catch(SQLException e){
            throw new DataLayerException("Unable to delete in relation CorsiDocenti", e);
        }
        
    }
    
    @Override
    public void deleteCorsiLibriTesto(int corso_key, int libro_testo_key) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiLibriTesto.setInt(1, corso_key); 
            sCorsiLibriTesto.setInt(2, libro_testo_key); 
            try(ResultSet rs = sCorsiLibriTesto.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //delete or insert
            if(key > 0){
                //delete
                dCorsiLibriTesto.setInt(1, key);
                
                dCorsiLibriTesto.executeUpdate();
                
            } else {
                throw new DataLayerException("Unable to delete in relation CorsiLibriTesto, no such row");
            }
                                 
        } catch(SQLException e){
            throw new DataLayerException("Unable to delete in relation CorsiMateriali", e);
        }
        
    }
    
    @Override
    public void deleteCorsiMateriali(int corso_key, int materiale_key) throws DataLayerException {
        
        int key = 0;
        
        try {
            sCorsiMateriali.setInt(1, corso_key); 
            sCorsiMateriali.setInt(2, materiale_key); 
            try(ResultSet rs = sCorsiMateriali.executeQuery()){
                
                if(rs.next()){
                    key = rs.getInt("id");
                }
                
            }
            
            //delete or insert
            if(key > 0){
                //delete
                dCorsiMateriali.setInt(1, key);
                
                dCorsiMateriali.executeUpdate();
                
            } else {
                throw new DataLayerException("Unable to delete in relation CorsiMateriali, no such row");
            }
                                 
        } catch(SQLException e){
            throw new DataLayerException("Unable to delete in relation CorsiMateriali", e);
        }
        
    }
    
    @Override
    public void deleteMateriale(int materiale_key) throws DataLayerException{
        
        try {
            
            //delete
            dMateriale.setInt(1, materiale_key);

            dMateriale.executeUpdate();
            
        } catch(SQLException e){
            throw new DataLayerException("Unable to delete Materiale", e);
        }
        
    }
    
    
    
    @Override
    public void destroy() {
        
        try {
            sCorso.close();
            sCorsoByIdLang.close();
            sCorsoByCodice.close();
            sCorsoByAnno.close();
            sCorsoByNome.close();
            sCorsoByNomeNonLike.close();
            sCorsoByNomeVersioni.close();
            sCorsoByCodiceAnnoLang.close();
            uCorsoById.close();
            iCorso.close();
            sUtente.close();
            sUtenteById.close();
            sUtenteByEmail.close();
            sUtenteByEmailLike.close();
            uUtenteById.close();
            uUtenteByEmail.close();
            iUtente.close();
            sCorsoLaurea.close();
            sCorsoLaureaById.close();
            sCorsoLaureaByNome.close();
            sLibroTestoById.close();
            sLibriTesto.close();
            iLibroTesto.close();
            uLibroTesto.close();
            sMaterialeById.close();
            sMateriali.close();   
            iMateriale.close();
            uMateriale.close();
            dMateriale.close();
            sDocenti.close();
            sDocenteById.close();
            sDocenteByEmail.close();
            sCorsiLaureaCorso.close();
            sCorsiPropedeuticiCorso.close();
            sCorsiMutuatiCorso.close();
            sModuliCorso.close();
            sLibriTestoCorso.close();
            sMaterialiCorso.close();   
            sDocentiCorso.close();
            sCFUCorsoCorsoLaurea.close();
            sLogMessage.close();
            
            iCorsiModuli.close();
            iCorsiCorsiMutuati.close();
            iCorsiCorsiPropedeutici.close();
            iCorsiCorsiLaurea.close();
            iCorsiDocenti.close();
            iCorsiLibriTesto.close();
            iCorsiMateriali.close();
            iLogMessage.close();
            
            uCorsiModuli.close();
            uCorsiCorsiMutuati.close();
            uCorsiCorsiPropedeutici.close();
            uCorsiCorsiLaurea.close();
            uCorsiDocenti.close();
            
            sCorsiModuli.close();
            sCorsiCorsiMutuati.close();
            sCorsiCorsiPropedeutici.close();
            sCorsiCorsiLaurea.close();
            sCorsiDocenti.close();
            sCorsiLibriTesto.close();
            sCorsiMateriali.close();
            
            dCorsiModuli.close();
            dCorsiCorsiMutuati.close();
            dCorsiCorsiPropedeutici.close();
            dCorsiCorsiLaurea.close();
            dCorsiDocenti.close();
            dCorsiLibriTesto.close();
            dCorsiMateriali.close();
            
            sInfoCorsiByIdCorsoLang.close();
            uInfoCorsiById.close();
            iInfoCorso.close();
                       
        }
        
        catch(SQLException ex) {
            //
        }
        
        super.destroy();
        
    }
    
    public List<Corso> filtraCorsi (List<Corso> corsi, String attributo, String filtro) throws DataLayerException {
        List<Corso> result = new ArrayList();
        
        switch(attributo){
            case "corso_codice": 
                for(int i=0; i<corsi.size(); i++){
                    if(corsi.get(i).getCodice().equals(filtro)) result.add(corsi.get(i));
                }
                break;
            case "corso_ssd":
                for(int i=0; i<corsi.size(); i++){
                    if(corsi.get(i).getSSD().equals(filtro)) result.add(corsi.get(i));
                }
                break;
            case "corso_semestre":
                for(int i=0; i<corsi.size(); i++){
                    if(corsi.get(i).getSemestre() == Integer.parseInt(filtro)) result.add(corsi.get(i));
                }
                break;
            case "corso_docente":
                for(int i=0; i<corsi.size(); i++){
                    List<Utente> docenti = corsi.get(i).getDocentiCorso();
                    for(int j=0; j<docenti.size();j++){
                        if(docenti.get(j).getCognome().equals(filtro)) {
                            result.add(corsi.get(i));
                            break;
                        }
                    }    
                }
                break;
            case "corso_lingua":
                for(int i=0; i<corsi.size(); i++){
                    if(corsi.get(i).getLingua().equals(filtro)) result.add(corsi.get(i));
                }
                break;
            case "corso_corsi_laurea":
                for(int i=0; i<corsi.size(); i++){
                    List<Corso_Laurea> corsi_laurea = corsi.get(i).getCorsiLaureaCorso();
                    for(int j=0; j<corsi_laurea.size();j++){
                        if(corsi_laurea.get(j).getNome().equals(filtro)) {
                            result.add(corsi.get(i));
                            break;
                        }
                    }    
                }
                break;
            default: 
                break;
        }
        return result; 
    }
    
    @Override
    public List<Utente> filtraUtenti (List<Utente> utenti, String attributo, String filtro) throws DataLayerException {
        List<Utente> result = new ArrayList();
        
        switch(attributo){
            case "utente_nome": 
                for(int i=0; i<utenti.size(); i++){
                    if(utenti.get(i).getNome().equals(filtro)) result.add(utenti.get(i));
                }
                break;
            case "utente_cognome":
                for(int i=0; i<utenti.size(); i++){
                    if(utenti.get(i).getCognome().equals(filtro)){
                        result.add(utenti.get(i));
                    }
                }
                break;
            case "utente_tipo_utente":
                for(int i=0; i<utenti.size(); i++){
                    if(utenti.get(i).getTipoUtente().equals(filtro)) result.add(utenti.get(i));
                }
                break;
            case "utente_email":
                result = getUtenteByEmailLike(filtro); 
                break;
            
            default: 
                break;
        }
        
        return result; 
    }
    
    @Override
    public List<Map<String, Object>> getCorsiLaureaANDCFU(Corso corso) throws DataLayerException {
        int id_corso = corso.getId();
        List<Corso_Laurea> corsi_laurea = corso.getCorsiLaureaCorso();
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>(); 
        
        for(Corso_Laurea corso_laurea : corsi_laurea){
            Map<String, Object> map = new HashMap<String, Object>(); 
            try {
                sCFUCorsoCorsoLaurea.setInt(1, id_corso);
                sCFUCorsoCorsoLaurea.setInt(2, corso_laurea.getId());
                try(ResultSet rs = sCFUCorsoCorsoLaurea.executeQuery()){

                    while(rs.next()){
                        map.put("nome", corso_laurea.getNome());
                        map.put("numero_cfu", rs.getString("numero_cfu"));
                        map.put("tipo_cfu", rs.getString("tipo_cfu"));
                        
                        result.add(map);
                    }

                }

            } catch(SQLException ex){
                throw new DataLayerException("Unable to get CFU by Corso", ex); 
            }
            
        }
        
        return result;
    }
    
    @Override
    public void storeLogMessage(String message) throws DataLayerException{
        
         try {
            
            iLogMessage.setString(1, message);
            
            iLogMessage.executeUpdate();
            
        } catch(SQLException e){
            throw new DataLayerException("Unable to store in log", e);
        }
        
    }
    
    @Override
    public List<String> getLogMessage() throws DataLayerException{
        List<String> result = new ArrayList();
        String date = "";
        try{
            try(ResultSet rs = sLogMessage.executeQuery()){
                while(rs.next()){
                    date = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(rs.getTimestamp("timestamp"));
                    result.add(date + " - " + rs.getString("messaggio"));
                }
            }
        }
        catch(SQLException ex){
            throw new DataLayerException("Unable to load log", ex);
        }
        
        return result;
    }
}
