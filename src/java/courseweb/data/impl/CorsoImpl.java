/*
 * Classe CorsoImpl
 */
package courseweb.data.impl;

import courseweb.data.model.Corso;
import courseweb.data.model.Utente;
import courseweb.data.model.Corso_Laurea;
import courseweb.data.model.CourseWebDataLayer;
import framework.data.DataLayerException;
import java.util.List;

/*
 * @author Flavio
 */
public class CorsoImpl implements Corso {
    
    private int id;
    private String nome;
    private String codice;
    private String ssd;
    private int semestre;
    private String lingua;
    private List<Utente> docenti;
    private List<Corso_Laurea> corsi_laurea;
    private CourseWebDataLayer ownerDataLayer;
    protected boolean dirty; 
    
    public CorsoImpl(CourseWebDataLayer ownerDataLayer) {
        this.ownerDataLayer = ownerDataLayer;
        this.id = 0;
        this.nome = "";
        this.codice = "";
        this.ssd = "";
        this.semestre = 0;
        this.lingua = "";
        this.docenti = null;
        this.corsi_laurea = null;
        this.dirty = false; 
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
    public String getLingua(){
        return this.lingua;
    }
    
    @Override
    public List<Utente> getDocenti() throws DataLayerException{
        if(this.docenti == null){
            this.docenti = ownerDataLayer.getUtenti();
        }
        return this.docenti;
    }
    
    @Override
    public List<Corso_Laurea> getCorsiLaurea() throws DataLayerException{
        if(this.corsi_laurea == null){
            this.corsi_laurea = ownerDataLayer.getCorsoLaurea();
        }
        return this.corsi_laurea;
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
    public void setLingua(String lingua){
        this.lingua = lingua;
    }
    
    @Override
    public void setDirty(boolean dirty){
        this.dirty = dirty; 
    }
    
    @Override
    public boolean isDirty(){
        return this.dirty; 
    }
}
