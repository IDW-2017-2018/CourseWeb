
<div class="filter">

    <h1 class="title">AGGIUNTA NUOVO MATERIALE ASSOCIATO AL CORSO</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=edit_material" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="materiale_nome">Nome</label>
                <input class="field" type="text" id="materiale_nome" name="materiale_nome"/>

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="materiale_descrizione">Descrizione</label>
                <input class="field" type="text" id="materiale_descrizione" name="materiale_descrizione"/>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_materiale_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
