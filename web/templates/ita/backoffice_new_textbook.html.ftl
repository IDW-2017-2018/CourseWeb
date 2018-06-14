
<div class="filter">

    <h1 class="title">AGGIUNTA NUOVO LIBRO TESTO ASSOCIATO AL CORSO</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=edit_textbook" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="libro_testo_autore">Autore</label>
                <input class="field" type="text" id="libro_testo_autore" name="libro_testo_autore"/>

                <label class="label" for="libro_testo_titolo">Titolo</label>
                <input class="field" type="text" id="libro_testo_titolo" name="libro_testo_titolo"/>

                <label class="label" for="libro_testo_volume">Volume</label>
                <input class="field" type="text" id="libro_testo_volume" name="libro_testo_volume"/>

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="libro_testo_anno">Anno</label>
                <input class="field" type="text" id="libro_testo_anno" name="libro_testo_anno"/>

                <label class="label" for="libro_testo_editore">Editore</label>
                <input class="field" type="text" id="libro_testo_editore" name="libro_testo_editore"/>

                <label class="label" for="libro_testo_link">Link</label>
                <input class="field" type="text" id="libro_testo_link" name="libro_testo_link"/>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_libro_testo_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
