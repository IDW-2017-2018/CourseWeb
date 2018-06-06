<div class="filter">
    
    <h1 class="title">AGGIUNGI CORSO</h1>
    
    <div class="formcontainer">
        
      <form action="backofficecourse?lang=${lang}&action=add_course" method="POST">

        <div class="fieldcontainercentral">

            <label class="label" for="corso_codice">Codice</label>
            <input class="field" type="text" id="corso_codice" name="corso_codice" required="required"/>

            <label class="label" for="corso_anno">Anno</label>
            <input class="field" type="text" id="corso_anno" name="corso_anno" required="required"/>

            <label class="label" for="corso_nome">Nome</label>
            <input class="field" type="text" id="corso_nome" name="corso_nome" required="required"/>
    
            <label class="label" for="corso_ssd">SSD</label>
            <input class="field" type="text" id="corso_ssd" name="corso_ssd" required="required"/>

            <label class="label" for="corso_semestre">Semestre</label>
            <select class="field" name="corso_semestre"">
                <option value="1">1</option>
                <option value="2">2</option>
            </select>

            <label class="label" for="corso_lingua">Lingua</label>
            <select class="field" name="corso_lingua"">
                <option value="italiano">Italiano</option>
                <option value="inglese">Inglese</option>
            </select>

            <label class="label" for="corso_link_homepage">Link Homepage</label>
            <input class="field" type="text" id="corso_link_homepage" name="corso_link_homepage"/>

            <label class="label" for="corso_link_risorse">Link Risorse</label>
            <input class="field" type="text" id="corso_link_risorse" name="corso_link_risorse"/>

            <label class="label" for="corso_link_forum">Link Forum</label>
            <input class="field" type="text" id="corso_link_forum" name="corso_link_forum"/>
        
        </div>

            <div class="fieldcontainerleft">

                <h1 class="title">INFO CORSO ITALIANO</h1>
                
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
                
                <h1 class="title">INFO CORSO INGLESE</h1>

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
            <input class="filterbutton" type="submit" name="aggiungi_corso" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
