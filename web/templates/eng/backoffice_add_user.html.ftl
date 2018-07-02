<div class="helper">
    
    <div class="helpertext">
        
        <p><b>ADDING A NEW USER</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>click on the button <b>ADD</b> to add a new user</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ADDING FORM</b></p>   
        <ul>
        <li>fields <b>EMAIL</b>, <b>PASSWORD</b>, <b>NAME</b>, <b>SURNAME</b>, <b>USER TYPE</b> are REQUIRED</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">ADD USER</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeuser?lang=${lang}&action=add_user" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="utente_email">Email [required field]</label>
                <input class="field" type="email" id="utente_email" name="utente_email" required="required"/>

                <label class="label" for="utente_password">Password [required field]</label>
                <input class="field" type="password" id="utente_password" name="utente_password" required="required"/>

                <label class="label" for="utente_ripeti_password">Retype Password [required field]</label>
                <input class="field" type="password" id="utente_ripeti_password" name="utente_ripeti_password" required="required"/>

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="utente_nome">Name [required field]</label>
                <input class="field" type="text" id="utente_nome" name="utente_nome" required="required"/>


                <label class="label" for="utente_cognome">Surname [required field]</label>
                <input class="field" type="text" id="utente_cognome" name="utente_cognome" required="required"/>
                
                <label class="label" for="utente_tipo_utente">User Type [required field]</label>
                <select class="field" name="utente_tipo_utente">
                    <option value="docente">Teacher</option>
                    <option value="amministratore">Admin</option>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_utente" value="ADD"/>
        </div>

      </form>

    </div>

</div>
