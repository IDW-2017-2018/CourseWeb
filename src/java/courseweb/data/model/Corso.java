/*
 * Interfaccia Corso
 */
package courseweb.data.model;

/**
 *
 * @author Flavio
 */
public interface Corso {
    
    int getId();
    String getNome();
    String getCodice();
    String getSSD();
    int getSemestre();
    int getDocente();
    String getLingua();    
    
    void setId(int id);
    void setNome(String nome);
    void setCodice(String codice);
    void setSSD(String ssd);
    void setSemestre(int semestre);
    void setDocente(int docente);
    void setLingua(String lingua);
       
}
