<div class="filter">
    
    <h1 class="title">ADD COURSE</h1>
    
    <div class="formcontainer">
        
      <form action="backofficecourse?lang=${lang}&action=add_course" method="POST">

        <div class="fieldcontainercentral">

            <label class="label" for="corso_codice">Code</label>
            <input class="field" type="text" id="corso_codice" name="corso_codice" required="required"/>

            <label class="label" for="corso_anno">Year</label>
            <select class="field" name="corso_anno" required="required">
                <option value="2000/2001">2000/2001</option>             
                <option value="2001/2002">2001/2002</option>             
                <option value="2002/2003">2002/2003</option>             
                <option value="2003/2004">2003/2004</option>             
                <option value="2004/2005">2004/2005</option>             
                <option value="2005/2006">2005/2006</option>             
                <option value="2006/2007">2006/2007</option>             
                <option value="2007/2008">2007/2008</option>             
                <option value="2008/2009">2008/2009</option>             
                <option value="2009/2010">2009/2010</option>             
                <option value="2010/2011">2010/2011</option>             
                <option value="2011/2012">2011/2012</option>             
                <option value="2012/2013">2012/2013</option>             
                <option value="2013/2014">2013/2014</option>             
                <option value="2014/2015">2014/2015</option>             
                <option value="2015/2016">2015/2016</option>             
                <option value="2016/2017">2016/2017</option>             
                <option value="2017/2018">2017/2018</option>             
            </select>

            <label class="label" for="corso_nome">Name</label>
            <input class="field" type="text" id="corso_nome" name="corso_nome" required="required"/>
    
            <label class="label" for="corso_ssd">SSD</label>
            <input class="field" type="text" id="corso_ssd" name="corso_ssd" required="required"/>

            <label class="label" for="corso_semestre">Semester</label>
            <select class="field" name="corso_semestre"">
                <option value="1">1</option>
                <option value="2">2</option>
            </select>

            <label class="label" for="corso_lingua">Language</label>
            <select class="field" name="corso_lingua"">
                <option value="italiano">Italian</option>
                <option value="inglese">English</option>
            </select>

            <label class="label" for="corso_link_homepage">Homepage Link</label>
            <input class="field" type="text" id="corso_link_homepage" name="corso_link_homepage"/>

            <label class="label" for="corso_link_risorse">Resources Link</label>
            <input class="field" type="text" id="corso_link_risorse" name="corso_link_risorse"/>

            <label class="label" for="corso_link_forum">Forum Link</label>
            <input class="field" type="text" id="corso_link_forum" name="corso_link_forum"/>
        
        </div>

            <div class="fieldcontainerleft">

                <h1 class="title">ITALIAN INFO COURSE </h1>
                
                <label class="label" for="corso_prerequisiti">Prerequisiti</label>
                <textarea class="field" type"text" id="corso_prerequisiti" name="corso_prerequisiti"> </textarea>

                <label class="label" for="corso_obiettivi">Obiettivi</label>
                <textarea class="field" type"text" id="corso_obiettivi" name="corso_obiettivi"> </textarea>
                
                <label class="label" for="corso_mod_esame">Modalit&agrave; Esame</label>
                <textarea class="field" type"text" id="corso_mod_esame" name="corso_mod_esame"> </textarea>

                <label class="label" for="corso_mod_insegnamento">Modalit&agrave; Insegnamento</label>
                <textarea class="field" type"text" id="corso_mod_insegna    mento" name="corso_mod_insegnamento"> </textarea>
                
                <label class="label" for="corso_descrittori_dublino">Descrittori Dublino</label>
                <textarea class="field" type"text" id="corso_descrittori_dublino" name="corso_descrittori_dublino" placeholder="KNOWLEDGE / APPLICATION / EVALUATION / COMUNICATION / LIFELONG LEARNING SKILLS"></textarea>

                <label class="label" for="corso_sillabo">Sillabo</label>
                <textarea class="field" type"text" id="corso_sillabo" name="corso_sillabo"> </textarea>

                <label class="label" for="corso_note">Note</label>
                <textarea class="field" type"text" id="corso_note" name="corso_note"> </textarea>
                
            </div>


            <div class="fieldcontainerright">
                
                <h1 class="title">ENGLISH INFO COURSE</h1>

                <label class="label" for="corso_prerequisiti_eng">Prerequisiti</label>
                <textarea class="field" type"text" id="corso_prerequisiti_eng" name="corso_prerequisiti_eng"> </textarea>

                <label class="label" for="corso_obiettivi_eng">Obiettivi</label>
                <textarea class="field" type"text" id="corso_obiettivi_eng" name="corso_obiettivi_eng"> </textarea>
                
                <label class="label" for="corso_mod_esame_eng">Modalit&agrave; Esame</label>
                <textarea class="field" type"text" id="corso_mod_esame_eng" name="corso_mod_esame_eng"> </textarea>

                <label class="label" for="corso_mod_insegnamento_eng">Modalit&agrave; Insegnamento</label>
                <textarea class="field" type"text" id="corso_mod_insegnamento_eng" name="corso_mod_insegnamento_eng"> </textarea>
                
                <label class="label" for="corso_descrittori_dublino_eng">Descrittori Dublino</label>
                <textarea class="field" type"text" id="corso_descrittori_dublino_eng" name="corso_descrittori_dublino_eng" placeholder="KNOWLEDGE / APPLICATION / EVALUATION / COMUNICATION / LIFELONG LEARNING SKILLS"></textarea>

                <label class="label" for="corso_sillabo_eng">Sillabo</label>
                <textarea class="field" type"text" id="corso_sillabo_eng" name="corso_sillabo_eng"> </textarea>

                <label class="label" for="corso_note_eng">Note</label>
                <textarea class="field" type"text" id="corso_note_eng" name="corso_note_eng"> </textarea>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_corso" value="ADD"/>
        </div>

      </form>

    </div>

</div>
