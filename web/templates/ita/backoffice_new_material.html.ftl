<div class="helper">
    
    <div class="helpertext">
        
        <p><b>AGGIUNTA NUOVO MATERIALE</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
        <li>clicca sul bottone <b>AGGIUNGI</b> per aggiungere un nuovo materiale e creare una relazione con il corso corrente</li>
        </ul>
        <hr>
        <p><b>INSERIMENTO DATI NELLA FORM DI AGGIUNTA</b></p>   
        <ul>
        <li>i campi <b>NOME</b>, <b>DESCRIZIONE</b> e <b>FILE</b> sono obbligatori</li>
        <li>il campo <b>FILE</b> permette all'utente di selezionare il file da caricare, qualunque tipologia di formato &egrave; ammessa</li>
        </ul>
    </div>

</div>

<div class="filter">

    <h1 class="title">AGGIUNTA NUOVO MATERIALE ASSOCIATO AL CORSO</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_material" method="POST" enctype="multipart/form-data">

            <div class="fieldcontainerleft">

                <label class="label" for="materiale_nome">Nome</label>
                <input class="field" type="text" id="materiale_nome" name="materiale_nome" required="required"/>
                
                <label class="label" for="materiale_file">File</label>
                <input class="field" type="file" id="materiale_file" name="materiale_file" required="required"/>

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="materiale_descrizione">Descrizione</label>
                <input class="field" type="text" id="materiale_descrizione" name="materiale_descrizione" required="required"/>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_materiale_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
