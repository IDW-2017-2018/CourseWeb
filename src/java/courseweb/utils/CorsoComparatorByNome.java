/*
 * Class CorsoComparatorByNome
 */
package courseweb.utils;

import courseweb.data.model.Corso;
import java.util.Comparator;

/**
 *
 * @author Riccardo
 */
public class CorsoComparatorByNome implements Comparator<Corso> {
    public int compare(Corso o1, Corso o2){
        return o1.compareTo(o2);
    }
}
