<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>ELIMINA RELAZIONE CON DOCENTE</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
          <li>clicca sul link <b>ELIMINA</b> relativo ad una relazione con docente per selezionarla e passare alla pagina di conferma eliminazione relativa alla relazione con dcoente selezionata </li>
        </ul>
        
    </div>

</div>

<#list items>

<div class="tablecontainer">
    
    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">DOCENTI ASSOCIATI</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">NOME</th>
            <th class="thresult">COGNOME</th>
            <th class="thresult">ELIMINA</th>

        </tr>

        <#items as item>

        <tr class="trresult-list">

            <td class="tdresult-list" >${strip_slashes(item.nome)}</td>
            <td class="tdresult-list" >${strip_slashes(item.cognome)}</td>
            <td class="tdresult-list"><a href="backofficeeditcourse?id=${id}&lang=${lang}&item=${item.id}&name=elimina_docente_action&action=delete_check" class="linkresultmod">ELIMINA</a></td>
        </tr>

        </#items>

    </table>

</div>

<#else>

    <h1 class="no_results">NESSUN RISULTATO</h1>

</#list>
