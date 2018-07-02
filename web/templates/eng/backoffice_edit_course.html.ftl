<div class="helper">
    
    <div class="helpertext">
        
        <p><b>EDIT COURSE</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>    click on the button <b>EDIT</b> to editing the infos of current course</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ADDING FORM</b></p>   
        <ul>
        <li>fields <b>CODE</b>, <b>NAME</b>, <b>SSD</b>, <b>SEMESTER</b>, <b>LANGUAGE</b>, <b>HOMEPAGE LINK</b>, <b>RISORSE LINK</b>, <b>FORUM LINK</b> have current course's default values</li>
        <li>fields alongside <b>ITALIAN INFO COURSE'S</b> and <b>ENGLISH INFO COURSE'S</b> have default current course's values</li>
        <li>to perform an edit, the user shall change at least a field's value inserting the up to date info in the field</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">EDIT COURSE</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso_ita.id}&action=edit_course" method="POST">

        <div class="fieldcontainercentral">

            <label class="label" for="corso_codice">Code</label>
            <input class="field" type="text" id="corso_codice" name="corso_codice" placeholder="${strip_slashes(corso_ita.codice)}"/>

            <label class="label" for="corso_nome">Name</label>
            <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${strip_slashes(corso_ita.nome)}"/>
    
            <label class="label" for="corso_ssd">SSD</label>
            <input class="field" type="text" id="corso_ssd" name="corso_ssd" placeholder="${strip_slashes(corso_ita.SSD)}"/>

            <label class="label" for="corso_semestre">Semester</label>
            <select class="field" name="corso_semestre">
                <option selected="selected" value="${corso_ita.semestre}">${corso_ita.semestre}</option>
                <option value="1">1</option>
                <option value="2">2</option>
            </select>

            <label class="label" for="corso_lingua">Language</label>
            <select class="field" name="corso_lingua">
                <option selected="selected" value="${corso_ita.lingua}">${corso_ita.lingua}</option>
                <option value="italiano">Italian</option>
                <option value="inglese">English</option>
            </select>

            <label class="label" for="corso_link_homepage">Homepage Link</label>
            <input class="field" type="text" id="corso_link_homepage" name="corso_link_homepage" placeholder="${strip_slashes(corso_ita.linkHomepageCorso)}"/>

            <label class="label" for="corso_link_risorse">Resource Link</label>
            <input class="field" type="text" id="corso_link_risorse" name="corso_link_risorse" placeholder="${strip_slashes(corso_ita.linkRisorseEsterne)}"/>

            <label class="label" for="corso_link_forum">Forum Link</label>
            <input class="field" type="text" id="corso_link_forum" name="corso_link_forum" placeholder="${strip_slashes(corso_ita.linkForum)}"/>
        
        </div>

            <div class="fieldcontainerleft">

                <h1 class="title">ITALIAN COURSE INFO</h1>
                
                <label class="label" for="corso_prerequisiti">Prerequisites</label>
                <textarea class="field" type="text" id="corso_prerequisiti" name="corso_prerequisiti">${strip_slashes(corso_ita.prerequisiti)}</textarea>

                <label class="label" for="corso_obiettivi">Course Objectives</label>
                <textarea class="field" type="text" id="corso_obiettivi" name="corso_obiettivi">${strip_slashes(corso_ita.obiettivi)}</textarea>
                
                <label class="label" for="corso_mod_esame">Assessment Methods and Criteria</label>
                <textarea class="field" type="text" id="corso_mod_esame" name="corso_mod_esame">${strip_slashes(corso_ita.modEsame)}</textarea>

                <label class="label" for="corso_mod_insegnamento">Teaching Methods</label>
                <textarea class="field" type="text" id="corso_mod_insegnamento" name="corso_mod_insegnamento">${strip_slashes(corso_ita.modInsegnamento)}</textarea>
                
                <label class="label" for="corso_descrittori_dublino">Dublin Descriptors</label>
                <textarea class="field" type="text" id="corso_descrittori_dublino" name="corso_descrittori_dublino">${strip_slashes(corso_ita.descrittoriDublino)}</textarea>

                <label class="label" for="corso_sillabo">Course Content</label>
                <textarea class="field" type="text" id="corso_sillabo" name="corso_sillabo">${strip_slashes(corso_ita.sillabo)}</textarea>

                <label class="label" for="corso_note">Notes</label>
                <textarea class="field" type="text" id="corso_note" name="corso_note">${strip_slashes(corso_ita.note)}</textarea>
                
            </div>


            <div class="fieldcontainerright">
                
                <h1 class="title">ENGLISH COURSE INFO</h1>

                <label class="label" for="corso_prerequisiti">Prerequisites</label>
                <textarea class="field" type="text" id="corso_prerequisiti" name="corso_prerequisiti_eng">${strip_slashes(corso_eng.prerequisiti)}</textarea>

                <label class="label" for="corso_obiettivi">Course Objectives</label>
                <textarea class="field" type="text" id="corso_obiettivi" name="corso_obiettivi_eng">${strip_slashes(corso_eng.obiettivi)}</textarea>
                
                <label class="label" for="corso_mod_esame">Assessment Methods and Criteria</label>
                <textarea class="field" type="text" id="corso_mod_esame" name="corso_mod_esame_eng">${strip_slashes(corso_eng.modEsame)}</textarea>

                <label class="label" for="corso_mod_insegnamento">Teaching Methods</label>
                <textarea class="field" type="text" id="corso_mod_insegnamento" name="corso_mod_insegnamento_eng">${strip_slashes(corso_eng.modInsegnamento)}</textarea>
                
                <label class="label" for="corso_descrittori_dublino">Dublin Descriptors</label>
                <textarea class="field" type="text" id="corso_descrittori_dublino" name="corso_descrittori_dublino_eng">${strip_slashes(corso_eng.descrittoriDublino)}</textarea>

                <label class="label" for="corso_sillabo">Course Content</label>
                <textarea class="field" type="text" id="corso_sillabo" name="corso_sillabo_eng">${strip_slashes(corso_eng.sillabo)}</textarea>

                <label class="label" for="corso_note">Notes</label>
                <textarea class="field" type="text" id="corso_note" name="corso_note_eng">${strip_slashes(corso_eng.note)}</textarea>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="modifica_corso_action" value="EDIT"/>
        </div>

      </form>

    </div>

</div>
