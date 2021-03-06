/*
 * Classe SecurityLayer
 * 
 * Classe che si occupa della sicurezza dei dati, della sessione, della connessione e dell'hashing
 * di stringhe e file
 */
package framework.security;

import java.io.IOException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import java.util.Calendar;
import java.util.Locale;

import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


/**
 *
 * @author Flavio
 */
public class SecurityLayer {
 
// ---------- SESSION SECURITY ----------    
    
    
    // controlli di sicurezza sulla sessione. se è valida, la aggiorna e la restituisce, altrimenti la cancella e ritorna null
    public static HttpSession checkSession(HttpServletRequest request){
        boolean check = true;
        HttpSession session = request.getSession(false);
        
        // vediamo se la sessione è attiva
        if (session == null){
            return null;
        }
        
        // check sulla validità della sessione
        if (session.getAttribute("userid") == null){
            check = false;
        // check sull'IP del client
        } else if((session.getAttribute("ip") == null) || !((String) session.getAttribute("ip")).equals(request.getRemoteHost()))
        {
            check = false;
        // check sulle date
        } else {
        // inizio sessione
            Calendar begin = (Calendar) session.getAttribute("inizio-sessione");
        // ultima azione
            Calendar last = (Calendar) session.getAttribute("ultima-azione");
        // data e ora correnti
            Calendar now = Calendar.getInstance();
            
            if(begin == null){
                check = false;
            } else {
                // secondi trascorsi dall'inizio della sessione
                long secondsfrombegin = (now.getTimeInMillis() - begin.getTimeInMillis()) /  1000;
                // dopo tre ore la sessione scade
                if (secondsfrombegin > 3*60*60) {
                    check = false;
                } else if(last != null) {
                    // secondi trascorsi dall'ultima azione
                    long secondsfromlast = (now.getTimeInMillis() - last.getTimeInMillis()) / 1000;
                    // dopo trenta minuti dall'ultima operazione la sessione è invalidata
                    if (secondsfromlast > 30*60){
                        check = false;
                    }
                }                    
            }
        }
        if (!check) {
            session.invalidate();
            return null;
        } else {
            // reimpostiamo la data e l'ora dell'ultima azione
            session.setAttribute("ultima-azione", Calendar.getInstance());
            return session;
        }
    }
    
    public static HttpSession createSession (HttpServletRequest request, String username, int userid){
        HttpSession session = request.getSession(true);
        session.setAttribute("username",username);
        session.setAttribute("ip",request.getRemoteHost());
        session.setAttribute("inizio-sessione",Calendar.getInstance());
        session.setAttribute("userid",userid);
        
        return session;
    }
    
    public static void disposeSession (HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session != null){
            session.invalidate();
        }
    }

// ---------- DATA SECURITY ----------

    // questa funzione aggiunge un \ davanti a tutti i caratteri pericolosi usati per eseguire SQL injection
    // attraverso i parametri delle form    
    public static String addSlashes(String s) {
        return s.replaceAll("(['\"\\\\])" , "\\\\$1");
    }
    
    // questa funzione rimuove gli slash aggiunti da addSlashes
    public static String stripSlashes(String s) {
        return s.replaceAll("\\\\(['\"\\\\])" , "$1");
    }
    
    public static int checkNumeric (String s) throws NumberFormatException {
        // convertiamo la stringa in numero ma assicuriamoci prima che sia valida
        if (s != null){
            return Integer.parseInt(s);
        } else {
            throw new NumberFormatException("String argument is null"); 
        }
    }

// ---------- CONNECTION SECURITY ----------
    
    // questa funzione verifica se il protocollo https è attivo   
    public static boolean checkHttps(HttpServletRequest request){
        return request.isSecure();
    }
    
    // questa funzione ridirige il browser sullo stesso indirizzo attuale ma con protocollo https
    public static void redirectToHttps(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        
        // estraiamo le parti della request url
        String server = request.getServerName();
        // int port = request.getServerPort();
        String context = request.getContextPath();
        String path = request.getServletPath();
        String info = request.getPathInfo();
        String query = request.getQueryString();
        
        String newUrl, lang; 
        Locale l = request.getLocale(); 
        if(l.getLanguage().equals("it")){
            lang = "ita"; 
        } else if(l.getLanguage().equals("en")) {
            lang = "eng"; 
        } else {
            lang = "eng"; 
        }
        
        // ricostruiamo la url cambiando il protocollo e la porta come specificato nella configurazione di tomcat
        //inoltre settiamo la variabile lang che ci permette di scegliere il template giusto
        
        if(query != null){
            if(query.contains("lang=")){
                newUrl = "https://" + server + ":8443" + context + path + (info != null ? info : "") + "?" + query;
            } else {
                newUrl = "https://" + server + ":8443" + context + path + (info != null ? info : "") + "?lang=" + lang + "&" + query;
            }
        } else {
            newUrl = "https://" + server + ":8443" + context + path + (info != null ? info : "") + "?lang=" + lang;
        }
        
        try {
            // ridirigiamo il client
            response.sendRedirect(newUrl);
        } catch(IOException ex1) {
            try{
                // in caso di problemi tentiamo prima di risolvere un errore http standard
                response.sendError(response.SC_INTERNAL_SERVER_ERROR , "Cannot redirect to HTTPS, blocking request");    
            } catch(IOException ex2) {
                // altrimenti generiamo un'eccezione
                throw new ServletException("Cannot redirect to HTTPS!");
            }
        }
    }

// ---------- HASHING ----------
    
    // fa l'hash di una stringa. utilizzato per le password
    protected static String hashString(String inputString, String hashAlgorithm) throws SecurityLayerException {
        String result = null;
        if (inputString == null || hashAlgorithm == null){
            throw new NullPointerException("Cannot hash, encountered a null string");
        }
        try {
            // oggetto digest per hashAlgorithm. è l'oggetto che converte la stringa in hash
            MessageDigest digest = MessageDigest.getInstance(hashAlgorithm);
            digest.update(inputString.getBytes(), 0, inputString.length());
            // converte il valore digest del messaggio in base 16
            BigInteger hashInteger = new BigInteger (1, digest.digest());
            // numbero di BigInteger convertito in stringa esadecimale
            result = hashInteger.toString(16);
        
        } catch(NoSuchAlgorithmException ex){
            throw new SecurityLayerException("Invalid hash algorithm", ex);
        }
        
        return result;
    }
    
    // fa l'md5 della stringa in input. il controller chiamerà questa funzione, non la versione protected ovviamente
    public static String md5String(String inputString) throws SecurityLayerException {
        return hashString(inputString , "MD5"); 
    }
    
    // fa l'hash di un file in input
    protected static String hashFile(File file, String hashAlgorithm) throws SecurityLayerException {
        String result = null;
        if (file == null || hashAlgorithm == null){
            throw new NullPointerException("Cannot hash, null encountered");
        }
        
        try {
            // apro filestream su un file
            FileInputStream inputFile = new FileInputStream (file);
            // oggetto messagedigest per l'algoritmo hashAlgorithm
            MessageDigest digest = MessageDigest.getInstance(hashAlgorithm);
            // leggo il file
            byte[] byteArray = new byte[1024];
            int read = 0;
            while ((read = inputFile.read(byteArray)) != -1) {
                digest.update(byteArray, 0, read);
            }
            inputFile.close();
            // converto messaggio digest in base 16
            BigInteger hashInteger = new BigInteger(1, digest.digest());
            result = hashInteger.toString(16);
            
        } catch(FileNotFoundException ex1) {
            throw new SecurityLayerException("File not found", ex1);
        
        } catch(NoSuchAlgorithmException ex2) {
            throw new SecurityLayerException("Invalid hash algorithm", ex2);
        
        } catch(IOException ex3) {
            throw new SecurityLayerException(ex3);
        }
        
        return result;
    }
    
    // fa l'hash di un file in input
    protected static String hashFile(InputStream inputFile, String hashAlgorithm) throws SecurityLayerException {
        String result = null;
        if (inputFile == null || hashAlgorithm == null){
            throw new NullPointerException("Cannot hash, null encountered");
        }
        
        try {
            
            // oggetto messagedigest per l'algoritmo hashAlgorithm
            MessageDigest digest = MessageDigest.getInstance(hashAlgorithm);
            // leggo il file
            byte[] byteArray = new byte[1024];
            int read = 0;
            while ((read = inputFile.read(byteArray)) != -1) {
                digest.update(byteArray, 0, read);
            }
            inputFile.close();
            // converto messaggio digest in base 16
            BigInteger hashInteger = new BigInteger(1, digest.digest());
            result = hashInteger.toString(16);
            
        } catch(FileNotFoundException ex1) {
            throw new SecurityLayerException("File not found", ex1);
        
        } catch(NoSuchAlgorithmException ex2) {
            throw new SecurityLayerException("Invalid hash algorithm", ex2);
        
        } catch(IOException ex3) {
            throw new SecurityLayerException(ex3);
        }
        
        return result;
    }
    
    // versione pubblica che verrà utilizzata dal controller per fare l'md5 di un file
    public static String md5File(File file) throws SecurityLayerException {
        return hashFile(file, "MD5");
    }
    
    // versione pubblica che verrà utilizzata dal controller per fare l'md5 di un file
    public static String md5File(InputStream is) throws SecurityLayerException {
        return hashFile(is, "MD5");
    }
}
