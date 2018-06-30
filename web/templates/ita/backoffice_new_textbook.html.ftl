<div class="helper">
    
    <div class="helpertext">
        
        <p><b>AGGIUNTA NUOVO LIBRO DI TESTO</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
        <li>clicca sul bottone <b>AGGIUNGI</b> per aggiungere un nuovo libro di testo e creare una relazione con il corso corrente</li>
        </ul>
        <hr>
        <p><b>INSERIMENTO DATI NELLA FORM DI AGGIUNTA</b></p>   
        <ul>
        <li>i campi <b>AUTORE</b>, <b>TITOLO</b> e <b>VOLUME</b>, <b>ANNO</b>, <b>EDITORE</b> sono obbligatori</li>
        </ul>
    </div>

</div>

<div class="filter">

    <h1 class="title">AGGIUNTA NUOVO LIBRO TESTO ASSOCIATO AL CORSO</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_textbook" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="libro_testo_autore">Autore</label>
                <input class="field" type="text" id="libro_testo_autore" name="libro_testo_autore" required="required"/>

                <label class="label" for="libro_testo_titolo">Titolo</label>
                <input class="field" type="text" id="libro_testo_titolo" name="libro_testo_titolo" required="required"/>

                <label class="label" for="libro_testo_volume">Volume</label>
                <input class="field" type="text" id="libro_testo_volume" name="libro_testo_volume" required="required"/>

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="libro_testo_anno">Anno</label>
                <input class="field" type="text" id="libro_testo_anno" name="libro_testo_anno" required="required"/>

                <label class="label" for="libro_testo_editore">Editore</label>
                <input class="field" type="text" id="libro_testo_editore" name="libro_testo_editore" required="required"/>

                <label class="label" for="libro_testo_link">Link</label>
                <input class="field" type="text" id="libro_testo_link" name="libro_testo_link"/>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_libro_testo_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
