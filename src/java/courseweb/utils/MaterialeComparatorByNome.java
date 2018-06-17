/*
 * Classe MaterialeComparatorByNome
 */
package courseweb.utils;

import courseweb.data.model.Materiale;
import java.util.Comparator;

/**
 *
 * @author Riccardo
 */
public class MaterialeComparatorByNome implements Comparator<Materiale> {
    @Override
    public int compare(Materiale o1, Materiale o2){
        return o1.compareTo(o2);
    }
}
