/*
 * Class LogComparatorByDateDesc
 */
package courseweb.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;

/**
 *
 * @author Riccardo
 */
public class LogComparatorByDateDesc implements Comparator<String> {
    @Override
    public int compare(String o1, String o2) {
        String date_o1 = o1.substring(0, o1.indexOf("- "));
        String date_o2 = o2.substring(0, o2.indexOf("- "));
        Date date1 = null;
        Date date2 = null;
        
        try {
            
            date1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(date_o1);
            date2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(date_o2);
        
        } catch(ParseException e){
            e.printStackTrace();
        }
        
        if((date1 != null) && (date2 != null))
            return date2.compareTo(date1);
        else
            throw new RuntimeException("Cannot sort log by Date");
        
    }
}
