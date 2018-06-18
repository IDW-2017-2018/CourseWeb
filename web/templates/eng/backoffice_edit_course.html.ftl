<div class="helper">
    
    <div class="helpertext">
        
        <p><b>TITOLO</b></p>

        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        <hr>
        <p><b>TITOLO</b><br>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        
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
                <option selected="selected" disabled="disabled" value="${corso_ita.semestre}">${corso_ita.semestre}</option>
                <option value="1">1</option>
                <option value="2">2</option>
            </select>

            <label class="label" for="corso_lingua">Language</label>
            <select class="field" name="corso_lingua">
                <option selected="selected" disabled="disabled" value="${corso_ita.lingua}">${corso_ita.lingua}</option>
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
                <textarea class="field" type="text" id="corso_prerequisiti" name="corso_prerequisiti" placeholder="${strip_slashes(corso_ita.prerequisiti)}"></textarea>

                <label class="label" for="corso_obiettivi">Course Objectives</label>
                <textarea class="field" type="text" id="corso_obiettivi" name="corso_obiettivi" placeholder="${strip_slashes(corso_ita.obiettivi)}"></textarea>
                
                <label class="label" for="corso_mod_esame">Assessment Methods and Criteria</label>
                <textarea class="field" type="text" id="corso_mod_esame" name="corso_mod_esame" placeholder="${strip_slashes(corso_ita.modEsame)}"></textarea>

                <label class="label" for="corso_mod_insegnamento">Teaching Methods</label>
                <textarea class="field" type="text" id="corso_mod_insegnamento" name="corso_mod_insegnamento" placeholder="${strip_slashes(corso_ita.modInsegnamento)}"></textarea>
                
                <label class="label" for="corso_descrittori_dublino">Dublin Descriptors</label>
                <textarea class="field" type="text" id="corso_descrittori_dublino" name="corso_descrittori_dublino" placeholder="${strip_slashes(corso_ita.descrittoriDublino)}"></textarea>

                <label class="label" for="corso_sillabo">Course Content</label>
                <textarea class="field" type="text" id="corso_sillabo" name="corso_sillabo" placeholder="${strip_slashes(corso_ita.sillabo)}"></textarea>

                <label class="label" for="corso_note">Notes</label>
                <textarea class="field" type="text" id="corso_note" name="corso_note" placeholder="${strip_slashes(corso_ita.note)}"></textarea>
                
            </div>


            <div class="fieldcontainerright">
                
                <h1 class="title">ENGLISH COURSE INFO</h1>

                <label class="label" for="corso_prerequisiti">Prerequisites</label>
                <textarea class="field" type="text" id="corso_prerequisiti" name="corso_prerequisiti_eng" placeholder="${strip_slashes(corso_eng.prerequisiti)}"></textarea>

                <label class="label" for="corso_obiettivi">Course Objectives</label>
                <textarea class="field" type="text" id="corso_obiettivi" name="corso_obiettivi_eng" placeholder="${strip_slashes(corso_eng.obiettivi)}"></textarea>
                
                <label class="label" for="corso_mod_esame">Assessment Methods and Criteria</label>
                <textarea class="field" type="text" id="corso_mod_esame" name="corso_mod_esame_eng" placeholder="${strip_slashes(corso_eng.modEsame)}"></textarea>

                <label class="label" for="corso_mod_insegnamento">Teaching Methods</label>
                <textarea class="field" type="text" id="corso_mod_insegnamento" name="corso_mod_insegnamento_eng" placeholder="${strip_slashes(corso_eng.modInsegnamento)}"></textarea>
                
                <label class="label" for="corso_descrittori_dublino">Dublin Descriptors</label>
                <textarea class="field" type="text" id="corso_descrittori_dublino" name="corso_descrittori_dublino_eng" placeholder="${strip_slashes(corso_eng.descrittoriDublino)}"></textarea>

                <label class="label" for="corso_sillabo">Course Content</label>
                <textarea class="field" type="text" id="corso_sillabo" name="corso_sillabo_eng" placeholder="${strip_slashes(corso_eng.sillabo)}"></textarea>

                <label class="label" for="corso_note">Notes</label>
                <textarea class="field" type="text" id="corso_note" name="corso_note_eng" placeholder="${strip_slashes(corso_eng.note)}"></textarea>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="modifica_corso_action" value="EDIT"/>
        </div>

      </form>

    </div>

</div>
