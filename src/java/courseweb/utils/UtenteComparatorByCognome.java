/*
 * Class UtenteComparatorByCognome
 */
package courseweb.utils;

import courseweb.data.model.Utente;
import java.util.Comparator;

/**
 *
 * @author Riccardo
 */
public class UtenteComparatorByCognome implements Comparator<Utente> {
    public int compare(Utente o1, Utente o2){
        return o1.compareTo(o2);
    }
}
