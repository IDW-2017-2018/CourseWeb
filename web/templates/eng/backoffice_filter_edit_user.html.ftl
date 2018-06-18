<div class="helper">
    
    <div class="helpertext">
        
        <p><b>TITOLO</b></p>

        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        <hr>
        <p><b>TITOLO</b><br>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">FILTERS</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeuser?lang=${lang}&action=edit_user" method="POST">
        

            <div class="fieldcontainerleft">
                
            
            <label class="label" for="utente_nome">Name</label>
            <input class="field" type="text" id="utente_nome" name="utente_nome"/>
            
            <label class="label" for="utente_cognome">Surname</label>
            <input class="field" type="text" id="utente_cognome" name="utente_cognome"/>


            </div>


            <div class="fieldcontainerright">
                
            
            <label class="label" for="utente_email">Email</label>
            <input class="field" type="text" id="utente_email" name="utente_email"/>
    
            <label class="label" for="utente_tipo_utente">User Type</label>
            <select class="field" name="utente_tipo_utente">
                <option value="docente">Teacher</option>
                <option value="amministratore">Admin</option>
            </select>
                   

            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="filtra" value="SEARCH"/>
        </div>

      </form>

    </div>

</div>


<#list utenti>

<div class="tablecontainer">
    
    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">USERS</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">NAME</th>
            <th class="thresult" colspan="2">SURNAME</th>
            <th class="thresult">EMAIL</th>
            <th class="thresult">USER TYPE</th>
            <th class="thresult">EDIT</th>

        </tr>

        <#items as utente>

        <tr class="trresult-list">

            <td class="tdresult-list" colspan="2">${utente.nome}</td>
            <td class="tdresult-list">${utente.cognome}</td>
            <td class="tdresult-list">${utente.email}</td>
            <td class="tdresult-list">${utente.tipoUtente}</td>
            <td class="tdresult-list"><a href="backofficeuser?lang=${lang}&id=${utente.id}&action=edit_user" class="linkresultmod">EDIT</a></td>
            
        </tr>

        </#items>

    </table>

</div>

<#else>

</#list>
