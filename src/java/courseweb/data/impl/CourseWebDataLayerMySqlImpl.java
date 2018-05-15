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
    
    private PreparedStatement sCorso, sCorsoById, sCorsoByCodice, sCorsoByAnno, sCorsoByNome, sCorsoByCodiceAnno, uCorsoByCodiceAnno, iCorsoByCodiceAnno;
    private PreparedStatement sUtente, sUtenteById, sUtenteByEmail, uUtenteById, uUtenteByEmail, iUtente;
    private PreparedStatement sCorsoLaurea, sCorsoLaureaById, sCorsoLaureaByNome;
    private PreparedStatement sLibriTesto, sLibroTestoById;
    private PreparedStatement sMateriali, sMaterialeById;
    
    private PreparedStatement sDocenti, sDocenteById, sDocenteByEmail, sDocentiCorso;
    private PreparedStatement sCorsiLaureaCorso;
    private PreparedStatement sCorsiPropedeuticiCorso;
    private PreparedStatement sCorsiMutuatiCorso;
    private PreparedStatement sCorsiIntegratiCorso;
    private PreparedStatement sLibriTestoCorso;
    private PreparedStatement sMaterialiCorso;     
          
    public CourseWebDataLayerMySqlImpl(DataSource datasource) throws SQLException, NamingException {
        super(datasource);
    }
    
    @Override
    public void init() throws DataLayerException{
        try  {
            super.init();
            // precompilo le query
            sCorso = connection.prepareStatement("SELECT * FROM corsi");
            sCorsoById = connection.prepareStatement("SELECT * FROM corsi WHERE id=?");
            sCorsoByCodice = connection.prepareStatement("SELECT * FROM corsi WHERE codice=?");
            sCorsoByAnno = connection.prepareStatement("SELECT * FROM corsi WHERE anno=?");
            sCorsoByNome = connection.prepareStatement("SELECT * FROM corsi WHERE nome LIKE '%?%'");
            sCorsoByCodiceAnno = connection.prepareStatement("SELECT * FROM corsi WHERE codice=? AND anno=?");
            uCorsoByCodiceAnno = connection.prepareStatement("UPDATE corsi SET codice=?, anno=?, ssd=?, semestre=?, lingua=?, prerequisiti=?, obiettivi=?, mod_esame=?, mod_insegnamento=?, sillabo=?, link_homepage=?, link_risorse=?, link_forum=?, note=?, lang=? WHERE codice=? AND anno=? AND lang=?");
            iCorsoByCodiceAnno = connection.prepareStatement("INSERT INTO corsi (codice,anno,nome,lang) VALUES(?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
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
            sLibriTesto = connection.prepareStatement("SELECT * FROM libri_testo");
            
            sMaterialeById = connection.prepareStatement("SELECT * FROM materiali WHERE id=?");
            sMateriali = connection.prepareStatement("SELECT * FROM materiali");
            
            //query complesse
            sDocenti = connection.prepareStatement("SELECT * FROM utenti WHERE tipo_utente='docente'");
            sDocenteById = connection.prepareStatement("SELECT * FROM utenti WHERE tipo_utente='docente' AND id=?");
            sDocenteByEmail = connection.prepareStatement("SELECT * FROM utenti WHERE tipo_utente='docente' AND email=?");
            
            sCorsiLaureaCorso = connection.prepareStatement("SELECT * FROM corsi_corsi_laurea INNER JOIN corsi_laurea ON (corsi_corsi_laurea.id_corso_laurea = corsi_laurea.id) WHERE corsi_corsi_laurea.id_corso=?");  
            sCorsiPropedeuticiCorso = connection.prepareStatement("SELECT * FROM corsi_corsi_propedeutici INNER JOIN corsi ON (corsi_corsi_propedeutici.id_corso_propedeutico = corsi.id) WHERE corsi_corsi_propedeutici.id_corso=?");
            sCorsiMutuatiCorso = connection.prepareStatement("SELECT * FROM corsi_corsi_mutuati INNER JOIN corsi ON (corsi_corsi_mutuati.id_corso_mutuato = corsi.id) WHERE corsi_corsi_mutuati.id_corso=?");
            sCorsiIntegratiCorso = connection.prepareStatement("SELECT * FROM corsi_corsi_integrati INNER JOIN corsi ON (corsi_corsi_integrati.id_corso_integrato = corsi.id) WHERE corsi_corsi_integrati.id_corso=?");
            
            sLibriTestoCorso = connection.prepareStatement("SELECT * FROM corsi_libri_testo INNER JOIN libri_testo ON (corsi_libri_testo.id_libro_testo = libri_testo.id) WHERE corsi_libri_testo.id_corso=?");
            sMaterialiCorso = connection.prepareStatement("SELECT * FROM corsi_materiali INNER JOIN materiali ON (corsi_materiali.id_materiale = materiali.id) WHERE corsi_materiali.id_corso=?");
            sDocentiCorso = connection.prepareStatement("SELECT * FROM corsi_docenti INNER JOIN utenti ON (corsi_docenti.id_docente = utenti.id) WHERE corsi_docenti.id_corso=?");
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
            
            c.setLang(rs.getString("lang"));
            
            /* oggetti complessi */
            c.setDocenti(getDocentiCorso(c));
            c.setCorsiLaurea(getCorsiLaureaCorso(c));
            c.setLibriTesto(getLibriTestoCorso(c));
            c.setCorsiPropedeutici(getCorsiPropedeuticiCorso(c));
            c.setCorsiMutuati(getCorsiMutuatiCorso(c));
            c.setCorsiIntegrati(getCorsiIntegratiCorso(c));
            c.setMateriali(getMaterialiCorso(c));
            
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
    
    
    @Override
    public Corso getCorso(int corso_key) throws DataLayerException {
        
        try {
            sCorsoById.setInt(1, corso_key);
            try(ResultSet rs = sCorsoById.executeQuery()){
                
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
    public List<Corso> getCorso(String corso_codice, String corso_anno) throws DataLayerException {
        //2 corsi, in base a lang
        
        List<Corso> result = new ArrayList<Corso>(); 
        
        try {
            sCorsoByCodiceAnno.setString(1, corso_codice);
            sCorsoByCodiceAnno.setString(2, corso_anno);
            try(ResultSet rs = sCorsoByCodiceAnno.executeQuery()){
                
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
                    result.add(getCorso(rs.getInt("id")));
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
                    result.add(getCorso(rs.getInt("id")));
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
            sCorsoByNome.setString(1,corso_nome);
            try(ResultSet rs = sCorsoByNome.executeQuery()) {
                while(rs.next()){
                    result.add(getCorso(rs.getInt("id")));
                }
            }
        }
        catch(SQLException exc){
            exc.printStackTrace();
        }
        return result;
    }
    
    @Override
    public List<Corso> getCorsi() throws DataLayerException {
        List<Corso> result = new ArrayList(); 
                   
        try(ResultSet rs = sCorso.executeQuery()) {          
                
            while(rs.next()){
                result.add(getCorso(rs.getInt("id")));
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
        
        System.out.println(corsi.size());
        
        for(int i = 0; i < corsi.size(); i++){
            Corso item = corsi.get(i); 
           
                System.out.println("i = " + i);
            
            for(int j = i + 1; j < (corsi.size() - 1); j++){
                Corso now = corsi.get(j);
                
                    System.out.println("j = " + j);
                
                if(now.getNome().equals(item.getNome())){
                    //assunzione campo anno tipo "2016/2017" stringa
                   
                    String anno_1 = item.getAnno().substring(0, item.getAnno().lastIndexOf("/")); //2016
                    String anno_2 = now.getAnno().substring(0, now.getAnno().lastIndexOf("/"));
                    
                    if(anno_2.compareTo(anno_1) > 0){
                        item = now; 
                    }
                 
                } else {
                    //prosegui ricerca
                }
                
            }
            
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
                 
                } else {
                    //prosegui ricerca
                }
                
            }
            
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
            Corso item = lista_corsi.get(i); 
           
            for(int j = i + 1; j < (lista_corsi.size() - 1); j++){
                Corso now = lista_corsi.get(j);
                
                if( (now.getCodice().equals(item.getCodice())) && (now.getAnno().equals(item.getAnno())) ){
                    
                    String lang_corso_1 = item.getLang(); 
                    String lang_corso_2 = now.getLang(); 
                    
                    if(lang.equals(lang_corso_2)){
                        //scegliamo il corso in accordo alla lingua, cambiamo se l'item scelto precedentemente
                        //non ha la lingua esatta
                        item = now; 
                    }
                 
                } else {
                    //prosegui ricerca
                }
                
            }
            
            result.add(item); 
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
                    result.add(getCorsoLaurea(rs.getInt("id")));
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
                    result.add(getCorso(rs.getInt("id")));
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
                    result.add(getCorso(rs.getInt("id")));
                }
            } 
        }
        
        catch(SQLException ex){
            throw new DataLayerException("Unable to load Corsi Mutuati by Corso", ex); 
        }
        
        return result;      
        
    }
    
    @Override
    public List<Corso> getCorsiIntegratiCorso(Corso corso) throws DataLayerException {
        List<Corso> result = new ArrayList(); 
        
        try{     
            sCorsiIntegratiCorso.setInt(1, corso.getId());
            try(ResultSet rs = sCorsiIntegratiCorso.executeQuery()) {          
                
                while(rs.next()){
                    result.add(getCorso(rs.getInt("id")));
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
                    result.add(getLibroTesto(rs.getInt("id")));
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
                    result.add(getMateriale(rs.getInt("id")));
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
                    result.add(getUtente(rs.getInt("id")));
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
            uUtenteById.setString(1, utente.getEmail());
            uUtenteById.setString(2, utente.getPassword());
            uUtenteById.setString(3, utente.getNome());
            uUtenteById.setString(4, utente.getCognome());
            uUtenteById.setInt(5, utente.getId());
            uUtenteById.executeUpdate();
            }
            else { //insert
                iUtente.setString(1, utente.getEmail());
                iUtente.setString(2, utente.getPassword());
                iUtente.setString(3, utente.getTipoUtente());
                iUtente.setString(4, utente.getNome());
                iUtente.setString(5, utente.getCognome());
                
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
            uUtenteByEmail.setString(1, utente.getEmail());
            uUtenteByEmail.setString(2, utente.getPassword());
            uUtenteByEmail.setString(3, utente.getNome());
            uUtenteByEmail.setString(4, utente.getCognome());
            uUtenteByEmail.setString(5, utente.getEmail());
            uUtenteByEmail.executeUpdate();
            }
            else { //insert
                iUtente.setString(1, utente.getEmail());
                iUtente.setString(2, utente.getPassword());
                iUtente.setString(3, utente.getTipoUtente());
                iUtente.setString(4, utente.getNome());
                iUtente.setString(5, utente.getCognome());
                
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
                
            uCorsoByCodiceAnno.setString(1, corso.getCodice());
            uCorsoByCodiceAnno.setString(2, corso.getAnno());
                
            uCorsoByCodiceAnno.setString(3, corso.getSSD());
            uCorsoByCodiceAnno.setInt(4, corso.getSemestre());
            uCorsoByCodiceAnno.setString(5, corso.getLingua());
            uCorsoByCodiceAnno.setString(6, corso.getPrerequisiti());
            uCorsoByCodiceAnno.setString(7, corso.getObiettivi());
            uCorsoByCodiceAnno.setString(8, corso.getModEsame());
            uCorsoByCodiceAnno.setString(9, corso.getModInsegnamento());
            uCorsoByCodiceAnno.setString(10, corso.getSillabo());
            uCorsoByCodiceAnno.setString(11, corso.getLinkHomepageCorso());
            uCorsoByCodiceAnno.setString(12, corso.getLinkRisorseEsterne());
            uCorsoByCodiceAnno.setString(13, corso.getLinkForum());
            uCorsoByCodiceAnno.setString(14, corso.getNote());
            
            uCorsoByCodiceAnno.setString(15, corso.getLang());
            
            uCorsoByCodiceAnno.setString(16, corso.getCodice());
            uCorsoByCodiceAnno.setString(17, corso.getAnno());
            
            uCorsoByCodiceAnno.setString(18, corso.getLang());
            
            
            uCorsoByCodiceAnno.executeUpdate();
            }
            else { //insert
                iCorsoByCodiceAnno.setString(1, corso.getCodice());
                iCorsoByCodiceAnno.setString(2, corso.getAnno());
                iCorsoByCodiceAnno.setString(3, corso.getNome());
                iCorsoByCodiceAnno.setString(4, corso.getLang());
                
                if(iCorsoByCodiceAnno.executeUpdate() == 1) {
                    
                    try(ResultSet keys = iCorsoByCodiceAnno.getGeneratedKeys()) {
                        if(keys.next()) {
                            key = keys.getInt(1);
                        }
                    }
                    
                }
            }
            if(key > 0) {
                corso.copyFrom(getCorso(key));
            }
            corso.setDirty(false);
        }
        catch(SQLException ex) {
            throw new DataLayerException("Unable to store Corso by codice & anno", ex);
        }
        
    }
    
    @Override
    public void destroy() {
        
        try {
            sCorso.close();
            sCorsoById.close();
            sCorsoByCodice.close();
            sCorsoByAnno.close();
            sCorsoByCodiceAnno.close();
            uCorsoByCodiceAnno.close();
            iCorsoByCodiceAnno.close();
            sUtente.close();
            sUtenteById.close();
            sUtenteByEmail.close();
            uUtenteById.close();
            uUtenteByEmail.close();
            iUtente.close();
            sCorsoLaurea.close();
            sCorsoLaureaById.close();
            sCorsoLaureaByNome.close();
            sLibriTesto.close();
            sLibroTestoById.close();
            sMateriali.close();
            sMaterialeById.close();
            sDocenti.close();
            sDocenteById.close();
            sDocenteByEmail.close();
            sDocentiCorso.close();
            sCorsiLaureaCorso.close();
            sCorsiPropedeuticiCorso.close();
            sCorsiMutuatiCorso.close();
            sCorsiIntegratiCorso.close();
            sLibriTestoCorso.close();
            sMaterialiCorso.close();    
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
                    if(corsi.get(i).getCodice().equals(filtro)) result.add(corsi.get(i));
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
                        if(docenti.get(j).getNome().equals(filtro)) {
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
    
}
