/*
 * Classe CorsoImpl
 */
package courseweb.data.impl;

import courseweb.data.model.Corso;
import courseweb.data.model.CourseWebDataLayer;

/*
 * @author Flavio
 */
public class CorsoImpl implements Corso {
    
    private int id;
    private String nome;
    private String codice;
    private String ssd;
    private int semestre;
    private int docente;
    private String lingua;
    private CourseWebDataLayer ownerDataLayer;
    
    public CorsoImpl(CourseWebDataLayer ownerDataLayer) {
        this.ownerDataLayer = ownerDataLayer;
        this.id = 0;
        this.nome = "";
        this.codice = "";
        this.ssd = "";
        this.semestre = 0;
        this.docente = 0;
        this.lingua = "";
    }
    
    @Override
    public int getId(){
        return this.id;
    }
    
    @Override
    public String getNome(){
        return this.nome;
    }
    
    @Override
    public String getCodice(){
        return this.codice;
    }
    
    @Override
    public String getSSD(){
        return this.ssd;
    }
    
    @Override
    public int getSemestre(){
        return this.semestre;
    }
    
    @Override
    public int getDocente(){
        return this.docente;
    }
    
    @Override
    public String getLingua(){
        return this.lingua;
    }
    
    protected void setId(int id){
        this.id = id;
    }
    
    @Override
    public void setNome(String nome){
        this.nome = nome;
    }
    
    @Override
    public void setCodice(String codice){
        this.codice = codice;
    }
    
    @Override
    public void setSSD(String ssd){
        this.ssd = ssd;
    }
    
    @Override
    public void setSemestre(int semestre){
        this.semestre = semestre;
    }
    
    @Override
    public void setDocente(int docente){
        this.docente = docente;
    }
    
    @Override
    public void setLingua(String lingua){
        this.lingua = lingua;
    }
    
}
