<div class="helper">
    
    <div class="helpertext">
        
        <p><b>EDIT USER</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
          <li>click on the <b>EDIT</b> button to editing the infos of the current user</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ADDING FORM</b></p>   
        <ul>
          <li>fields <b>EMAIL</b>, <b>NAME</b>, <b>SURNAME</b>, <b>USER TYPE</b> on default are filled with values of current user</li>
          <li>For editing, the user must change at least one field</li>
          <li>NOTE: editing the user type might be a risky operation (but in no case the user can damage the system)</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">EDIT USER</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeuser?lang=${lang}&action=edit_user&id=${utente.id}" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="utente_email">Email</label>
                <input class="field" type="text" id="utente_email" name="utente_email" placeholder="${strip_slashes(utente.email)}"/>

                <label class="label" for="utente_password">Password</label>
                <input class="field" type="password" id="utente_password" name="utente_password"/>

                <label class="label" for="utente_ripeti_password">Retype Password</label>
                <input class="field" type="password" id="utente_ripeti_password" name="utente_ripeti_password"/>

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="utente_nome">Name</label>
                <input class="field" type="text" id="utente_nome" name="utente_nome" placeholder="${strip_slashes(utente.nome)}"/>

                <label class="label" for="utente_cognome">Surname</label>
                <input class="field" type="text" id="utente_cognome" name="utente_cognome" placeholder="${strip_slashes(utente.cognome)}"/>
                
                <label class="label" for="utente_tipo_utente">User Type</label>
                <select class="field" name="utente_tipo_utente">
                    <option value="${utente.tipoUtente}">${utente.tipoUtente}</option>
                    <option value="docente">Teacher</option>
                    <option value="amministratore">Admin</option>
                </select>

            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="modifica_utente" value="EDIT"/>
        </div>

      </form>

    </div>

</div>

