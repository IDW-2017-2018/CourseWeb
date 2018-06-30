<div class="helper">
    
    <div class="helpertext">
        
        <p><b>AGGIUNTA NUOVO CORSO</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
          <li>clicca sul bottone <b>AGGIUNGI</b> per aggiungere un nuovo corso</li>
        </ul>
        <hr>
        <p><b>INSERIMENTO DATI NELLA FORM DI AGGIUNTA</b></p>   
        <ul>
          <li>i campi <b>CODICE</b>, <b>NOME</b>, <b>SSD</b>, <b>SEMESTRE</b>, <b>LINGUA</b>, <b>DOCENTE</b> sono CAMPI OBBLIGATORI</li>
          <li>i campo <b>ANNO</b> viene inserito automaticamente dal sistema, la data corrisponde sempre a quella dell'anno accademico corrente</li>
          <li>i campi <b>LINK HOMEPAGE</b>, <b>LINK RISORSE</b>, <b>LINK FORUM</b> possono essere inseriti in modo arbitrario</li>
        </ul>  
        <hr>  
        <p><b>INSERIMENTO DATI NELLE FORM RELATIVE ALLE INFO IN ITALIANO E INGLESE ASSOCIATE AL CORSO</b></p>   
        <p>i casi durante l'inserimento dei dati possono essere 3</p>
        <ul>
          <li>se l'utente lascia vuoti tutti i campi relativi ad entrambe le form (info corso in italiano e info corso in inglese) vengono caricate le info (in una lingua o entrambe) dello stesso corso, dell'anno accademico pi&ugrave; prossimo al corrente, se disponibili, altrimenti il corso viene caricato nel sistema senza info associate</li>
          <li>se l'utente riempie in modo parziale o totale i campi relativi a entrambe le form (info corso in italiano e info corso in inglese), il corso viene caricato con le info associate specificate dall'utente al momento della creazione in entrambe le lingue</li>
          <li>se l'utente riempie in modo parziale o totale i campi relativi a una sola form (info corso in italiano o info corsi in inglese), il corso viene caricato nel sistema con le info associate relative alla sola lingua specificata dall'utente in fase di creazione</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">AGGIUNGI CORSO</h1>
    
    <div class="formcontainer">
        
      <form action="backofficecourse?lang=${lang}&action=add_course" method="POST">

        <div class="fieldcontainercentral">

            <label class="label" for="corso_codice">Codice [campo richiesto]</label>
            <input class="field" type="text" id="corso_codice" name="corso_codice" required="required"/>

            <label class="label" for="corso_anno">Anno [campo richiesto]</label>
            <input class="field" type="text" id="corso_anno" name="corso_anno" disabled="disabled" placeholder="${anno}"/>

            <label class="label" for="corso_nome">Nome [campo richiesto]</label>
            <input class="field" type="text" id="corso_nome" name="corso_nome" required="required"/>
    
            <label class="label" for="corso_ssd">SSD [campo richiesto]</label>
            <input class="field" type="text" id="corso_ssd" name="corso_ssd" required="required"/>

            <label class="label" for="corso_semestre">Semestre [campo richiesto]</label>
            <select class="field" name="corso_semestre">
                <option value="1">1</option>
                <option value="2">2</option>
            </select>

            <label class="label" for="corso_lingua">Lingua [campo richiesto]</label>
            <select class="field" name="corso_lingua">
                <option value="italiano">Italiano</option>
                <option value="inglese">Inglese</option>
            </select>

            <label class="label" for="corso_docente">Docente [campo richiesto]</label>
            <select class="field" name="corso_docente" required="required">
            <#list docenti>
                <#items as docente>
                <option value="${docente.id}">${strip_slashes(docente.cognome)}</option>
                </#items>
            <#else>
            </#list>
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
                <textarea class="field" type"text" id="corso_prerequisiti" name="corso_prerequisiti"></textarea>

                <label class="label" for="corso_obiettivi">Obiettivi</label>
                <textarea class="field" type"text" id="corso_obiettivi" name="corso_obiettivi"></textarea>
                
                <label class="label" for="corso_mod_esame">Modalit&agrave; Esame</label>
                <textarea class="field" type"text" id="corso_mod_esame" name="corso_mod_esame"></textarea>

                <label class="label" for="corso_mod_insegnamento">Modalit&agrave; Insegnamento</label>
                <textarea class="field" type"text" id="corso_mod_insegna    mento" name="corso_mod_insegnamento"></textarea>
                
                <label class="label" for="corso_descrittori_dublino">Descrittori Dublino</label>
                <textarea class="field" type"text" id="corso_descrittori_dublino" name="corso_descrittori_dublino" placeholder="KNOWLEDGE \ APPLICATION \ EVALUATION \ COMUNICATION \ LIFELONG LEARNING SKILLS"></textarea>

                <label class="label" for="corso_sillabo">Sillabo</label>
                <textarea class="field" type"text" id="corso_sillabo" name="corso_sillabo"></textarea>

                <label class="label" for="corso_note">Note</label>
                <textarea class="field" type"text" id="corso_note" name="corso_note"></textarea>
                
            </div>


            <div class="fieldcontainerright">
                
                <h1 class="title">INFO CORSO INGLESE</h1>

                <label class="label" for="corso_prerequisiti_eng">Prerequisiti</label>
                <textarea class="field" type"text" id="corso_prerequisiti_eng" name="corso_prerequisiti_eng"></textarea>

                <label class="label" for="corso_obiettivi_eng">Obiettivi</label>
                <textarea class="field" type"text" id="corso_obiettivi_eng" name="corso_obiettivi_eng"></textarea>
                
                <label class="label" for="corso_mod_esame_eng">Modalit&agrave; Esame</label>
                <textarea class="field" type"text" id="corso_mod_esame_eng" name="corso_mod_esame_eng"></textarea>

                <label class="label" for="corso_mod_insegnamento_eng">Modalit&agrave; Insegnamento</label>
                <textarea class="field" type"text" id="corso_mod_insegnamento_eng" name="corso_mod_insegnamento_eng"></textarea>
                
                <label class="label" for="corso_descrittori_dublino_eng">Descrittori Dublino</label>
                <textarea class="field" type"text" id="corso_descrittori_dublino_eng" name="corso_descrittori_dublino_eng"></textarea>

                <label class="label" for="corso_sillabo_eng">Sillabo</label>
                <textarea class="field" type"text" id="corso_sillabo_eng" name="corso_sillabo_eng"></textarea>

                <label class="label" for="corso_note_eng">Note</label>
                <textarea class="field" type"text" id="corso_note_eng" name="corso_note_eng"></textarea>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_corso" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
