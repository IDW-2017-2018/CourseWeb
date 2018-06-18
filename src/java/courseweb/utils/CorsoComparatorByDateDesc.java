/*
 * Class CorsoComparatorByDateDesc
 */
package courseweb.utils;

import courseweb.data.model.Corso;
import java.util.Comparator;

/**
 *
 * @author Riccardo
 */
public class CorsoComparatorByDateDesc implements Comparator<Corso>{
    @Override
    public int compare(Corso o1, Corso o2){
        return o2.getAnno().compareTo(o1.getAnno());
    }
}
