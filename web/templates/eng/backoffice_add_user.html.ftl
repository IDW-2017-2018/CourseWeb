<div class="filter">
    
    <h1 class="title">ADD USER</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeuser?lang=${lang}&action=add_user" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="utente_email">Email</label>
                <input class="field" type="email" id="utente_email" name="utente_email" required="required"/>

                <label class="label" for="utente_password">Password</label>
                <input class="field" type="password" id="utente_password" name="utente_password" required="required"/>

                <label class="label" for="utente_ripeti_password">Retype Password</label>
                <input class="field" type="password" id="utente_ripeti_password" name="utente_ripeti_password" required="required"/>

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="utente_nome">Name</label>
                <input class="field" type="text" id="utente_nome" name="utente_nome" required="required"/>


                <label class="label" for="utente_cognome">Surname</label>
                <input class="field" type="text" id="utente_cognome" name="utente_cognome" required="required"/>
                
                <label class="label" for="utente_tipo_utente">User Type</label>
                <select class="field" name="utente_tipo_utente" disabled="disabled">
                    <option value="docente">Teacher</option>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_utente" value="ADD"/>
        </div>

      </form>

    </div>

</div>
