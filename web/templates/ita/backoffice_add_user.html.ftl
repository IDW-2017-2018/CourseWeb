<div class="helper">
    
    <div class="helpertext">
        
        <p><b>AGGIUNTA NUOVO UTENTE</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
          <li>clicca sul bottone <b>AGGIUNGI</b> per aggiungere un nuovo utente</li>
        </ul>
        <hr>
        <p><b>INSERIMENTO DATI NELLA FORM DI AGGIUNTA</b></p>   
        <ul>
          <li>i campi <b>EMAIL</b>, <b>PASSWORD</b>, <b>NOME</b>, <b>COGNOME</b>, <b>TIPO UTENTE</b> sono CAMPI OBBLIGATORI</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">AGGIUNGI UTENTE</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeuser?lang=${lang}&action=add_user" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="utente_email">Email [campo richiesto]</label>
                <input class="field" type="email" id="utente_email" name="utente_email" required="required"/>

                <label class="label" for="utente_password">Password [campo richiesto]</label>
                <input class="field" type="password" id="utente_password" name="utente_password" required="required"/>

                <label class="label" for="utente_ripeti_password">Ripeti Password [campo richiesto]</label>
                <input class="field" type="password" id="utente_ripeti_password" name="utente_ripeti_password" required="required"/>

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="utente_nome">Nome [campo richiesto]</label>
                <input class="field" type="text" id="utente_nome" name="utente_nome" required="required"/>


                <label class="label" for="utente_cognome">Cognome [campo richiesto]</label>
                <input class="field" type="text" id="utente_cognome" name="utente_cognome" required="required"/>
                
                <label class="label" for="utente_tipo_utente">Tipo Utente</label>
                <select class="field" name="utente_tipo_utente">
                    <option value="docente">Docente</option>
                    <option value="amministratore">Amministratore</option>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_utente" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
