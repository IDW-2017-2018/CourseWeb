/*
 * Class Corso_LaureaComparatorByNome
 */
package courseweb.utils;

import courseweb.data.model.Corso_Laurea;
import java.util.Comparator;

/**
 *
 * @author Riccardo
 */
public class Corso_LaureaComparatorByNome implements Comparator<Corso_Laurea> {
    @Override
    public int compare(Corso_Laurea o1, Corso_Laurea o2){
        return o1.compareTo(o2);
    }
}
