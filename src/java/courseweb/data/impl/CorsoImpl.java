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
import java.util.Iterator;

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
    private String descrittori_dublino;
    
    private String lang; 
    
    private List<Utente> docenti;
    private List<Corso_Laurea> corsi_laurea;
    private List<Libro_Testo> libri_testo;
    private List<Corso> corsi_propedeutici;
    private List<Corso> corsi_mutuati;
    private List<Corso> moduli;
    private List<Materiale> materiali;
    
    private CourseWebDataLayer ownerDataLayer;
    protected boolean dirty; 
    
    private String showTeachers;
    
    public String courseTeachers() throws DataLayerException{
    
        this.getDocentiCorso();
        return showTeachers;
    
    }
    
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
        this.descrittori_dublino = "";
        this.lang = ""; 
        
        this.docenti = null;
        this.corsi_laurea = null;
        this.libri_testo = null; 
        this.corsi_propedeutici = null;
        this.corsi_mutuati = null;
        this.moduli = null;
        this.materiali = null; 
        
        this.dirty = false; 
        
        this.showTeachers = "";
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
    public String getDescrittoriDublino(){
        return this.descrittori_dublino;
    }
    
    @Override
    public String getLang(){
        return this.lang; 
    }
    
    @Override
    public List<Utente> getDocentiCorso() throws DataLayerException{
        if(this.docenti == null){
            this.showTeachers = "";
            this.docenti = ownerDataLayer.getDocentiCorso(this);
            
            Iterator it = this.docenti.iterator();
            if(it.hasNext()){
                it.next();
            }
            for(Utente docente : this.docenti){
                if(it.hasNext()){
                    this.showTeachers += docente.getCognome() + ", ";
                    it.next();
                }
                else {
                    this.showTeachers += docente.getCognome();
                }
            }
        }
        return this.docenti;
    }
    
    @Override
    public List<Corso_Laurea> getCorsiLaureaCorso() throws DataLayerException{
        if(this.corsi_laurea == null){
            this.corsi_laurea = ownerDataLayer.getCorsiLaureaCorso(this);
        }
        return this.corsi_laurea;
    }
    
    @Override
    public List<Corso> getCorsiPropedeuticiCorso() throws DataLayerException{
        if(this.corsi_propedeutici == null){
            this.corsi_propedeutici = ownerDataLayer.getCorsiPropedeuticiCorso(this);
            this.corsi_propedeutici = ownerDataLayer.filterCorsiByLang(this.lang, this.corsi_propedeutici);
        }
        return this.corsi_propedeutici;
    }
    
    @Override
    public List<Corso> getCorsiMutuatiCorso() throws DataLayerException{
        if(this.corsi_mutuati == null){
            this.corsi_mutuati = ownerDataLayer.getCorsiMutuatiCorso(this);
            this.corsi_mutuati = ownerDataLayer.filterCorsiByLang(this.lang, this.corsi_mutuati);
        }
        return this.corsi_mutuati;
    }
    
    @Override
    public List<Corso> getModuliCorso() throws DataLayerException{
        if(this.moduli == null){
            this.moduli = ownerDataLayer.getModuliCorso(this);
            this.moduli = ownerDataLayer.filterCorsiByLang(this.lang, this.moduli);
        }
        return this.moduli;
    }
    
        @Override
    public List<Libro_Testo> getLibriTestoCorso() throws DataLayerException{
        if(this.libri_testo == null){
            this.libri_testo = ownerDataLayer.getLibriTestoCorso(this);
        }
        return this.libri_testo;
    }
    
    @Override
    public List<Materiale> getMaterialiCorso() throws DataLayerException{
        if(this.materiali == null){
            this.materiali = ownerDataLayer.getMaterialiCorso(this);
        }
        return this.materiali;
    }
    
    @Override
    public void setId(int id){
        this.id = id;
        this.dirty = true;
    }
    
    @Override
    public void setNome(String nome){
        this.nome = nome;
        this.dirty = true;
    }
    
    @Override
    public void setCodice(String codice){
        this.codice = codice;
        this.dirty = true;
    }
    
    @Override
    public void setSSD(String ssd){
        this.ssd = ssd;
        this.dirty = true;
    }
    
    @Override
    public void setSemestre(int semestre){
        this.semestre = semestre;
        this.dirty = true;
    }
    
    @Override
    public void setLingua(String lingua){
        this.lingua = lingua;
        this.dirty = true;
    }
    
    @Override
    public void setPrerequisiti(String prerequisiti){
        this.prerequisiti = prerequisiti;
        this.dirty = true;
    }
    
    @Override
    public void setObiettivi(String obiettivi){
        this.obiettivi = obiettivi;
        this.dirty = true;
    }
    
    @Override
    public void setModEsame(String mod_esame){
        this.mod_esame = mod_esame;
        this.dirty = true;
    }
    
    @Override
    public void setModInsegnamento(String insegnamento){
        this.insegnamento = insegnamento;
        this.dirty = true;
    }
    
    @Override
    public void setSillabo(String sillabo){
        this.sillabo = sillabo;
        this.dirty = true;
    }
    
    @Override
    public void setLinkHomepageCorso(String link_homepage_corso){
        this.link_homepage_corso = link_homepage_corso;
        this.dirty = true;
    }
    
    @Override
    public void setLinkRisorseEsterne(String link_risorse_esterne){
        this.link_risorse_esterne = link_risorse_esterne;
        this.dirty = true;
    }
    
    @Override
    public void setLinkForum(String link_forum){
        this.link_forum = link_forum;
        this.dirty = true;
    }
    
    @Override
    public void setAnno(String anno){
        this.anno = anno;
        this.dirty = true;
    }
    
    @Override
    public void setNote(String note){
        this.note = note;
        this.dirty = true;
    }
    
    @Override
    public void setDescrittoriDublino(String descrittori_dublino){
        this.descrittori_dublino = descrittori_dublino;
        this.dirty = true;
    }
    
    @Override
    public void setDocenti(List<Utente> docenti){
        this.docenti = docenti; 
        this.showTeachers = "";
        
        Iterator it = this.docenti.iterator();
        if(it.hasNext()){
            it.next();
        }
        for(Utente docente : this.docenti){
            if(it.hasNext()){
                this.showTeachers += docente.getCognome() + ", ";
                it.next();
            }
            else {
                this.showTeachers += docente.getCognome();
            }
        }
        
        this.dirty = true;
    }
    
    @Override
    public void setCorsiLaurea(List<Corso_Laurea> corsi_laurea){
        this.corsi_laurea = corsi_laurea; 
        this.dirty = true;
    }
    
    @Override
    public void setLibriTesto(List<Libro_Testo> libri_testo){
        this.libri_testo = libri_testo; 
        this.dirty = true;
    }
    
    @Override
    public void setCorsiPropedeutici(List<Corso> corsi_propedeutici){
        this.corsi_propedeutici = corsi_propedeutici; 
        this.dirty = true;
    }
    
    @Override
    public void setCorsiMutuati(List<Corso> corsi_mutuati){
        this.corsi_mutuati = corsi_mutuati; 
        this.dirty = true;
    }
    
    @Override
    public void setModuliCorso(List<Corso> moduli){
        this.moduli = moduli; 
        this.dirty = true;
    }
    
    @Override
    public void setMateriali(List<Materiale> materiali){
        this.materiali = materiali; 
        this.dirty = true;
    }
    
    
    @Override
    public void setLang(String lang){
        this.lang = lang; 
        this.dirty = true;
    }

    @Override
    public void copyFrom(Corso corso) throws DataLayerException{
        id = corso.getId();
        nome = corso.getNome();
        codice = corso.getCodice();
        ssd = corso.getSSD();
        semestre = corso.getSemestre();
        lingua = corso.getLingua();
        prerequisiti = corso.getPrerequisiti();
        obiettivi = corso.getObiettivi();
        mod_esame = corso.getModEsame();
        insegnamento = corso.getModInsegnamento();
        sillabo = corso.getSillabo();
        link_homepage_corso = corso.getLinkHomepageCorso();
        link_risorse_esterne = corso.getLinkRisorseEsterne();
        link_forum = corso.getLinkForum();
        anno = corso.getAnno();
        note = corso.getNote();
       
       
        lang = corso.getLang(); 
              
        docenti = corso.getDocentiCorso();
        corsi_laurea = corso.getCorsiLaureaCorso();
        libri_testo = corso.getLibriTestoCorso();
        corsi_propedeutici = corso.getCorsiPropedeuticiCorso();
        corsi_mutuati = corso.getCorsiMutuatiCorso();
        moduli = corso.getModuliCorso();
        materiali = corso.getMaterialiCorso();
        
        this.dirty = true;
    }
    
    @Override
    public void setDirty(boolean dirty){
        this.dirty = dirty; 
    }
    
    @Override
    public boolean isDirty(){
        return this.dirty; 
    }
    
    @Override 
    public String toString(){
        return this.getCodice() + " - " + this.getNome();   
    }
    
    @Override
    public int compareTo(Corso o){
        int comparison = this.nome.compareTo(o.getNome());
        
        return ( (comparison == 0) ? (this.anno.compareTo(o.getAnno())) : comparison );
    }
}
