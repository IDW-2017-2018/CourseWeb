<div class="helper">
    
    <div class="helpertext">
        
        <p><b>MODIFICA CORSO</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
        <li>clicca sul bottone <b>MODIFICA</b> per modificare le informazioni relative corso corrente</li>
        </ul>
        <hr>
        <p><b>INSERIMENTO DATI NELLA FORM DI AGGIUNTA</b></p>   
        <ul>
        <li>nei campi <b>CODICE</b>, <b>NOME</b>, <b>SSD</b>, <b>SEMESTRE</b>, <b>LINGUA</b>, <b>LINK HOMEPAGE</b>, <b>LINK RISORSE</b>, <b>LINK FORUM</b> appariranno di default i valori relativi al corso corrente</li>
        <li>nei campi relativi alle form <b>INFO CORSI IN ITALIANO</b> e <b>INFO CORSO IN INGLESE</b> appariranno di default i valori relativi al corso corrente</li>
        <li>per effettuare una modifica l'utente dovr&agrave; cambiare il valore di almeno un campo inserendo l'informazione aggiornata relativa a quest'ultimo</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">MODIFICA CORSO</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso_ita.id}&action=edit_course" method="POST">

        <div class="fieldcontainercentral">

            <label class="label" for="corso_codice">Codice</label>
            <input class="field" type="text" id="corso_codice" name="corso_codice" placeholder="${strip_slashes(corso_ita.codice)}"/>

            <label class="label" for="corso_nome">Nome</label>
            <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${strip_slashes(corso_ita.nome)}"/>
    
            <label class="label" for="corso_ssd">SSD</label>
            <input class="field" type="text" id="corso_ssd" name="corso_ssd" placeholder="${strip_slashes(corso_ita.SSD)}"/>

            <label class="label" for="corso_semestre">Semestre</label>
            <select class="field" name="corso_semestre">
                <option selected="selected" value="${corso_ita.semestre}">${corso_ita.semestre}</option>
                <option value="1">1</option>
                <option value="2">2</option>
            </select>

            <label class="label" for="corso_lingua">Lingua</label>
            <select class="field" name="corso_lingua">
                <option selected="selected" value="${corso_ita.lingua}">${corso_ita.lingua}</option>
                <option value="italiano">Italiano</option>
                <option value="inglese">Inglese</option>
            </select>

            <label class="label" for="corso_link_homepage">Link Homepage</label>
            <input class="field" type="text" id="corso_link_homepage" name="corso_link_homepage" placeholder="${strip_slashes(corso_ita.linkHomepageCorso)}"/>

            <label class="label" for="corso_link_risorse">Link Risorse</label>
            <input class="field" type="text" id="corso_link_risorse" name="corso_link_risorse" placeholder="${strip_slashes(corso_ita.linkRisorseEsterne)}"/>

            <label class="label" for="corso_link_forum">Link Forum</label>
            <input class="field" type="text" id="corso_link_forum" name="corso_link_forum" placeholder="${strip_slashes(corso_ita.linkForum)}"/>
        
        </div>

            <div class="fieldcontainerleft">

                <h1 class="title">INFO CORSO ITALIANO</h1>
                
                <label class="label" for="corso_prerequisiti">Prerequisiti</label>
                <textarea class="field" type="text" id="corso_prerequisiti" name="corso_prerequisiti">${strip_slashes(corso_ita.prerequisiti)}</textarea>

                <label class="label" for="corso_obiettivi">Obiettivi</label>
                <textarea class="field" type="text" id="corso_obiettivi" name="corso_obiettivi">${strip_slashes(corso_ita.obiettivi)}</textarea>
                
                <label class="label" for="corso_mod_esame">Modalit&agrave; Esame</label>
                <textarea class="field" type="text" id="corso_mod_esame" name="corso_mod_esame">${strip_slashes(corso_ita.modEsame)}</textarea>

                <label class="label" for="corso_mod_insegnamento">Modalit&agrave; Insegnamento</label>
                <textarea class="field" type="text" id="corso_mod_insegnamento" name="corso_mod_insegnamento">${strip_slashes(corso_ita.modInsegnamento)}</textarea>
                
                <label class="label" for="corso_descrittori_dublino">Descrittori Dublino</label>
                <textarea class="field" type="text" id="corso_descrittori_dublino" name="corso_descrittori_dublino">${strip_slashes(corso_ita.descrittoriDublino)}</textarea>

                <label class="label" for="corso_sillabo">Sillabo</label>
                <textarea class="field" type="text" id="corso_sillabo" name="corso_sillabo">${strip_slashes(corso_ita.sillabo)}</textarea>

                <label class="label" for="corso_note">Note</label>
                <textarea class="field" type="text" id="corso_note" name="corso_note">${strip_slashes(corso_ita.note)}</textarea>
                
            </div>


            <div class="fieldcontainerright">
                
                <h1 class="title">INFO CORSO INGLESE</h1>

                <label class="label" for="corso_prerequisiti">Prerequisiti</label>
                <textarea class="field" type="text" id="corso_prerequisiti" name="corso_prerequisiti_eng">${strip_slashes(corso_eng.prerequisiti)}</textarea>

                <label class="label" for="corso_obiettivi">Obiettivi</label>
                <textarea class="field" type="text" id="corso_obiettivi" name="corso_obiettivi_eng">${strip_slashes(corso_eng.obiettivi)}</textarea>
                
                <label class="label" for="corso_mod_esame">Modalit&agrave; Esame</label>
                <textarea class="field" type="text" id="corso_mod_esame" name="corso_mod_esame_eng">${strip_slashes(corso_eng.modEsame)}</textarea>

                <label class="label" for="corso_mod_insegnamento">Modalit&agrave; Insegnamento</label>
                <textarea class="field" type="text" id="corso_mod_insegnamento" name="corso_mod_insegnamento_eng">${strip_slashes(corso_eng.modInsegnamento)}</textarea>
                
                <label class="label" for="corso_descrittori_dublino">Descrittori Dublino</label>
                <textarea class="field" type="text" id="corso_descrittori_dublino" name="corso_descrittori_dublino_eng">${strip_slashes(corso_eng.descrittoriDublino)}</textarea>

                <label class="label" for="corso_sillabo">Sillabo</label>
                <textarea class="field" type="text" id="corso_sillabo" name="corso_sillabo_eng">${strip_slashes(corso_eng.sillabo)}</textarea>

                <label class="label" for="corso_note">Note</label>
                <textarea class="field" type="text" id="corso_note" name="corso_note_eng">${strip_slashes(corso_eng.note)}</textarea>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="modifica_corso_action" value="MODIFICA"/>
        </div>

      </form>

    </div>

</div>
