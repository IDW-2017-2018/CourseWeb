<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>AGGIUNTA NUOVA RELAZIONE CON MATERIALE</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
        <li>clicca sul bottone <b>AGGIUNGI</b> per aggiungere una nuova relazione con un materiale esistente</li>
        </ul>
        <hr>
        <p><b>INSERIMENTO DATI NELLA FORM DI AGGIUNTA</b></p>   
        <ul>
        <li>il campo <b>CORSO</b> contiene il nome del corso corrente, non pu&ograve; essere modificato</li>
        <li>il campo <b>MATERIALE</b> permette di scegliere il materiale da relazionare con il corso corrente, nella select appariranno solo i libri di testo che non possiedono gi&agrave; una relazione con il corso corrente</li>
        </ul>
        <hr>
        <p><b>AGGIUNTA NUOVO MATERIALE</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
        <li>clicca sul bottone <b>NUOVO</b> per aggiungere un nuovo materiale (il nuovo materiale creato verr&agrave; relazionato automaticamente con il corso corrente)</li>
        </ul>
        
    </div>

</div>

<div class="filter">

    <h1 class="title">AGGIUNTA RELAZIONE CON MATERIALE</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_material" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${strip_slashes(corso.nome)}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="materiale_nome">Materiale</label>
                <select class="field" name="materiale_nome" id="materiale_select">
                  <#list items>
                      <#items as item>
                      <option value="${item.id}">${strip_slashes(item.nome)} - ${datalayer.getUtente(item.utenteId).getNome()}&nbsp;${datalayer.getUtente(item.utenteId).getCognome()}</option>
                      </#items>
                  <#else>
                  </#list>
                </select>

                <label class="label" for="materiale_descrizione">Descrizione</label>
                <textarea class="field" type="text" id="materiale_descrizione" name="materiale_descrizione" readonly="readonly"></textarea>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_materiale_action" value="AGGIUNGI"/>
        </div>
      
      </form>

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_material" method="POST">

        <h1 class="title">AGGIUNGI NUOVO MATERIALE</h1>

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_materiale" value="NUOVO"/>
        </div>

      </form>

    </div>

</div>
