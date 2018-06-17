<div class="filter">
    
    <h1 class="title">MODIFICA UTENTE</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeuser?lang=${lang}&action=edit_user&id=${utente.id}" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="utente_email">Email</label>
                <input class="field" type="text" id="utente_email" name="utente_email" placeholder="${strip_slashes(utente.email)}"/>

                <label class="label" for="utente_password">Password</label>
                <input class="field" type="text" id="utente_password" name="utente_password" placeholder="${utente.password}"/>

                <label class="label" for="utente_ripeti_password">Ripeti Password</label>
                <input class="field" type="text" id="utente_ripeti_password" name="utente_ripeti_password"/>

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="utente_nome">Nome</label>
                <input class="field" type="text" id="utente_nome" name="utente_nome" placeholder="${strip_slashes(utente.nome)}"/>

                <label class="label" for="utente_cognome">Cognome</label>
                <input class="field" type="text" id="utente_cognome" name="utente_cognome" placeholder="${strip_slashes(utente.cognome)}"/>
                
                <label class="label" for="utente_tipo_utente">Tipo Utente</label>
                <select class="field" name="utente_tipo_utente">
                    <option value="docente">Docente</option>
                    <option value="amministratore">Amministratore</option>
                </select>

            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="modifica_utente" value="MODIFICA"/>
        </div>

      </form>

    </div>

</div>

