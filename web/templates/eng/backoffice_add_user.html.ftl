<div class="helper">
    
    <div class="helpertext">
        
        <p><b>TITOLO</b></p>

        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        <hr>
        <p><b>TITOLO</b><br>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        
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
