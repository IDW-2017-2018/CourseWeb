<div class="filter">
    
    <h1 class="title">FILTRI</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeuser?lang=${lang}&action=edit_user" method="POST">
        

            <div class="fieldcontainerleft">
                
            
            <label class="label" for="utente_nome">Nome</label>
            <input class="field" type="text" id="utente_nome" name="utente_nome"/>
            
            <label class="label" for="utente_cognome">Cognome</label>
            <input class="field" type="text" id="utente_cognome" name="utente_cognome"/>


            </div>


            <div class="fieldcontainerright">
                
            
            <label class="label" for="utente_email">Email</label>
            <input class="field" type="text" id="utente_email" name="utente_email"/>
    
            <label class="label" for="utente_tipo_utente">Tipo Utente</label>
            <select class="field" name="utente_tipo_utente">
                <option value="docente">Docente</option>
                <option value="amministratore">Amministratore</option>
            </select>
                   

            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="filtra" value="CERCA"/>
        </div>

      </form>

    </div>

</div>


<#list utenti>

<div class="tablecontainer">
    
    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">UTENTI</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">NOME</th>
            <th class="thresult" colspan="2">COGNOME</th>
            <th class="thresult">EMAIL</th>
            <th class="thresult">TIPO UTENTE</th>
            <th class="thresult">MODIFICA</th>

        </tr>

        <#items as utente>

        <tr class="trresult-list">

            <td class="tdresult-list" colspan="2">${utente.nome}</td>
            <td class="tdresult-list">${utente.cognome}</td>
            <td class="tdresult-list">${utente.email}</td>
            <td class="tdresult-list">${utente.tipoUtente}</td>
            <td class="tdresult-list"><a href="backofficeuser?lang=${lang}&id=${utente.id}&action=edit_user" class="linkresultmod">MODIFICA</a></td>
            
        </tr>

        </#items>

    </table>

</div>

<#else>

</#list>
