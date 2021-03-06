<div class="helper">
    
    <div class="helpertext">
        
        <p><b>NEW COURSE CREATION</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>click on the button <b>ADD</b> to add a new course</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ADDING FORM</b></p>   
        <ul>
        <li>fields <b>CODE</b>, <b>NAME</b>, <b>SSD</b>, <b>SEMESTER</b>, <b>LANGUAGE</b> <b>TEACHER</b> are REQUIRED</li>
        <li><b>YEAR</b> field is automatically inserted by the sistem, date corrseponds to current academic year</li>
        <li>fields <b>HOMEPAGE LINK</b>, <b>RESOURCE LINK</b>, <b>FORUM LINK</b> can be arbitrarily inserted</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ITALIAN AND ENGLISH COURSE DESCRIPTION FORM</b></p>   
        <p>there are three possible scenarios while inserting data:</p>
        <ul>
          <li>if every single field  is empty, description of the same course, but from the most recent year will be added. if this is the first year for the course, at least one field must be filled</li>
          <li>if user partially or completely fills both italian and english fields, the course will be added with these descriptions.</li>
          <li>if user partially or completely fills only the fields for one language, only these ones will be saved within the course. In the course page, anyway, for both language the same descriptions will be showed</li>
        </ul>

        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">ADD COURSE</h1>
    
    <div class="formcontainer">
        
      <form action="backofficecourse?lang=${lang}&action=add_course" method="POST">

        <div class="fieldcontainercentral">

            <label class="label" for="corso_codice">Code [required field]</label>
            <input class="field" type="text" id="corso_codice" name="corso_codice" required="required"/>

            <label class="label" for="corso_anno">Year [required field]</label>
            <input class="field" type="text" id="corso_anno" name="corso_anno" disabled="disabled" placeholder="${anno}"/>

            <label class="label" for="corso_nome">Name [required field]</label>
            <input class="field" type="text" id="corso_nome" name="corso_nome" required="required"/>
    
            <label class="label" for="corso_ssd">SSD [required field]</label>
            <input class="field" type="text" id="corso_ssd" name="corso_ssd" required="required"/>

            <label class="label" for="corso_semestre">Semester [required field]</label>
            <select class="field" name="corso_semestre">
                <option value="1">1</option>
                <option value="2">2</option>
            </select>

            <label class="label" for="corso_lingua">Language [required field]</label>
            <select class="field" name="corso_lingua">
                <option value="italiano">Italian</option>
                <option value="inglese">English</option>
            </select>

            <label class="label" for="corso_docente">Teacher [required field]</label>
            <select class="field" name="corso_docente" required="required">
            <#list docenti>
                <#items as docente>
                <option value="${docente.id}">${strip_slashes(docente.cognome)}</option>
                </#items>
            <#else>
            </#list>
            </select>

            <label class="label" for="corso_link_homepage">Homepage Link</label>
            <input class="field" type="text" id="corso_link_homepage" name="corso_link_homepage"/>

            <label class="label" for="corso_link_risorse">Resources Link</label>
            <input class="field" type="text" id="corso_link_risorse" name="corso_link_risorse"/>

            <label class="label" for="corso_link_forum">Forum Link</label>
            <input class="field" type="text" id="corso_link_forum" name="corso_link_forum"/>
        
        </div>

            <div class="fieldcontainerleft">

                <h1 class="title">ITALIAN COURSE DESCRIPTION</h1>
                
                <label class="label" for="corso_prerequisiti">Prerequisiti</label>
                <textarea class="field" type"text" id="corso_prerequisiti" name="corso_prerequisiti"> </textarea>

                <label class="label" for="corso_obiettivi">Obiettivi</label>
                <textarea class="field" type"text" id="corso_obiettivi" name="corso_obiettivi"> </textarea>
                
                <label class="label" for="corso_mod_esame">Modalit&agrave; Esame</label>
                <textarea class="field" type"text" id="corso_mod_esame" name="corso_mod_esame"> </textarea>

                <label class="label" for="corso_mod_insegnamento">Modalit&agrave; Insegnamento</label>
                <textarea class="field" type"text" id="corso_mod_insegna    mento" name="corso_mod_insegnamento"> </textarea>
                
                <label class="label" for="corso_descrittori_dublino">Descrittori Dublino</label>
                <textarea class="field" type"text" id="corso_descrittori_dublino" name="corso_descrittori_dublino" placeholder="KNOWLEDGE \ APPLICATION \ EVALUATION \ COMUNICATION \ LIFELONG LEARNING SKILLS"></textarea>

                <label class="label" for="corso_sillabo">Sillabo</label>
                <textarea class="field" type"text" id="corso_sillabo" name="corso_sillabo"> </textarea>

                <label class="label" for="corso_note">Note</label>
                <textarea class="field" type"text" id="corso_note" name="corso_note"> </textarea>
                
            </div>


            <div class="fieldcontainerright">
                
                <h1 class="title">ENGLISH COURSE DESCRIPTION</h1>

                <label class="label" for="corso_prerequisiti_eng">Prerequisiti</label>
                <textarea class="field" type"text" id="corso_prerequisiti_eng" name="corso_prerequisiti_eng"> </textarea>

                <label class="label" for="corso_obiettivi_eng">Obiettivi</label>
                <textarea class="field" type"text" id="corso_obiettivi_eng" name="corso_obiettivi_eng"> </textarea>
                
                <label class="label" for="corso_mod_esame_eng">Modalit&agrave; Esame</label>
                <textarea class="field" type"text" id="corso_mod_esame_eng" name="corso_mod_esame_eng"> </textarea>

                <label class="label" for="corso_mod_insegnamento_eng">Modalit&agrave; Insegnamento</label>
                <textarea class="field" type"text" id="corso_mod_insegnamento_eng" name="corso_mod_insegnamento_eng"> </textarea>
                
                <label class="label" for="corso_descrittori_dublino_eng">Descrittori Dublino</label>
                <textarea class="field" type"text" id="corso_descrittori_dublino_eng" name="corso_descrittori_dublino_eng" placeholder="KNOWLEDGE \ APPLICATION \ EVALUATION \ COMUNICATION \ LIFELONG LEARNING SKILLS"></textarea>

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
