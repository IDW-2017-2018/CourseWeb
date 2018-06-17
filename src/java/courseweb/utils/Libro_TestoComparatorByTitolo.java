/*
 * Class Libro_TestoComparatorByTitolo
 */
package courseweb.utils;

import courseweb.data.model.Libro_Testo;
import java.util.Comparator;

/**
 *
 * @author Riccardo
 */
public class Libro_TestoComparatorByTitolo implements Comparator<Libro_Testo> {
    @Override
    public int compare(Libro_Testo o1, Libro_Testo o2){
        return o1.compareTo(o2);
    }
}
