/*
 * Classe CorsoImpl
 */
package courseweb.data.impl;

import courseweb.data.model.Corso;
import courseweb.data.model.Utente;
import courseweb.data.model.Corso_Laurea;
import courseweb.data.model.CourseWebDataLayer;
import courseweb.data.model.Materiale; 
import framework.data.DataLayerException;
import java.util.List;
import courseweb.data.model.Libro_Testo;

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
    private String prerequisiti; 
    private String obiettivi; 
    private String mod_esame; 
    private String insegnamento; 
    private String sillabo; 
    private String link_homepage_corso; 
    private String link_risorse_esterne; 
    private String link_forum; 
    private String anno; 
    private String note; 
    
    private List<Utente> docenti;
    private List<Corso_Laurea> corsi_laurea;
    private List<Libro_Testo> libri_testo;
    private List<Corso> corsi_propedeutici;
    private List<Corso> corsi_mutuati;
    private List<Corso> corsi_integrati;
    private List<Materiale> materiali;
    
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
        this.prerequisiti = ""; 
        this.obiettivi = ""; 
        this.mod_esame = ""; 
        this.insegnamento = ""; 
        this.sillabo = ""; 
        this.link_homepage_corso = ""; 
        this.link_risorse_esterne = ""; 
        this.link_forum = ""; 
        this.anno = ""; 
        this.note = ""; 
        
        this.docenti = null;
        this.corsi_laurea = null;
        this.libri_testo = null; 
        this.corsi_propedeutici = null;
        this.corsi_mutuati = null;
        this.corsi_integrati = null;
        this.materiali = null; 
        
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
    public String getPrerequisiti(){
        return this.prerequisiti;
    }
    
    @Override
    public String getObiettivi(){
        return this.obiettivi;
    }
    
    @Override
    public String getModEsame(){
        return this.mod_esame;
    }
    
    @Override
    public String getModInsegnamento(){
        return this.insegnamento;
    }
    
    @Override
    public String getSillabo(){
        return this.sillabo;
    }
    
    @Override
    public String getLinkHomepageCorso(){
        return this.link_homepage_corso;
    }
    
    @Override
    public String getLinkRisorseEsterne(){
        return this.link_risorse_esterne;
    }
    
    @Override
    public String getLinkForum(){
        return this.link_forum;
    }
    
    @Override
    public String getAnno(){
        return this.anno;
    }
    
    @Override
    public String getNote(){
        return this.note;
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
            this.corsi_laurea = ownerDataLayer.getCorsiLaurea();
        }
        return this.corsi_laurea;
    }
    
    @Override
    public List<Libro_Testo> getLibriTesto() throws DataLayerException{
        if(this.libri_testo == null){
            this.libri_testo = ownerDataLayer.getLibriTesto();
        }
        return this.libri_testo;
    }
    
    @Override
    public List<Corso> getCorsiPropedeutici() throws DataLayerException{
        if(this.corsi_propedeutici == null){
            this.corsi_propedeutici = ownerDataLayer.getCorsiPropedeutici();
        }
        return this.corsi_propedeutici;
    }
    
    @Override
    public List<Corso> getCorsiMutuati() throws DataLayerException{
        if(this.corsi_mutuati == null){
            this.corsi_mutuati = ownerDataLayer.getCorsiMutuati();
        }
        return this.corsi_mutuati;
    }
    
    @Override
    public List<Corso> getCorsiIntegrati() throws DataLayerException{
        if(this.corsi_integrati == null){
            this.corsi_integrati = ownerDataLayer.getCorsiIntegrati();
        }
        return this.corsi_integrati;
    }
    
    @Override
    public List<Materiale> getMateriali() throws DataLayerException{
        if(this.materiali == null){
            this.materiali = ownerDataLayer.getMateriali();
        }
        return this.materiali;
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
    public void setPrerequisiti(String prerequisiti){
        this.prerequisiti = prerequisiti;
    }
    
    @Override
    public void setObiettivi(String obiettivi){
        this.obiettivi = obiettivi;
    }
    
    @Override
    public void setModEsame(String mod_esame){
        this.mod_esame = mod_esame;
    }
    
    @Override
    public void setModInsegnamento(String insegnamento){
        this.insegnamento = insegnamento;
    }
    
    @Override
    public void setSillabo(String sillabo){
        this.sillabo = sillabo;
    }
    
    @Override
    public void setLinkHomepageCorso(String link_homepage_corso){
        this.link_homepage_corso = link_homepage_corso;
    }
    
    @Override
    public void setLinkRisorseEsterne(String link_risorse_esterne){
        this.link_risorse_esterne = link_risorse_esterne;
    }
    
    @Override
    public void setLinkForum(String link_forum){
        this.link_forum = link_forum;
    }
    
    @Override
    public void setAnno(String anno){
        this.anno = anno;
    }
    
    @Override
    public void setNote(String note){
        this.note = note;
    }
    
    @Override
    public void setDocenti(List<Utente> docenti){
        this.docenti = docenti; 
    }
    
    @Override
    public void setCorsiLaurea(List<Corso_Laurea> corsi_laurea){
        this.corsi_laurea = corsi_laurea; 
    }
    
    @Override
    public void setLibriTesto(List<Libro_Testo> libri_testo){
        this.libri_testo = libri_testo; 
    }
    
    @Override
    public void setCorsiPropedeutici(List<Corso> corsi_propedeutici){
        this.corsi_propedeutici = corsi_propedeutici; 
    }
    
    @Override
    public void setCorsiMutuati(List<Corso> corsi_mutuati){
        this.corsi_mutuati = corsi_mutuati; 
    }
    
    @Override
    public void setCorsiIntegrati(List<Corso> corsi_integrati){
        this.corsi_integrati = corsi_integrati; 
    }
    
    @Override
    public void setMateriali(List<Materiale> materiali){
        this.materiali = materiali; 
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
