import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class md5Generator {

	// fa l'hash di una stringa. utilizzato per le password
protected static String hashString(String inputString, String hashAlgorithm) throws NoSuchAlgorithmException {
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
        throw new NoSuchAlgorithmException("Invalid hash algorithm", ex);
    }
    
    return result;
}

public static void main(String[] args) throws NoSuchAlgorithmException {

	System.out.println("a = " + hashString("a", "MD5")); 
	System.out.println("b = " + hashString("b", "MD5")); 

}

}

