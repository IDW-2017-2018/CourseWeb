
<#list items>

<div class="tablecontainer">
    
    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">LIST TEACHERS</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">NAME</th>
            <th class="thresult">SURNAME</th>
            <th class="thresult">DELETE</th>

        </tr>

        <#items as item>

        <tr class="trresult-list">

            <td class="tdresult-list" >${strip_slashes(item.nome)}</td>
            <td class="tdresult-list" >${strip_slashes(item.cognome)}</td>
            <td class="tdresult-list"><a href="backofficeeditcourse?id=${id}&lang=${lang}&item=${item.id}&name=elimina_docente_action&action=delete_check" class="linkresultmod">DELETE</a></td>
            
        </tr>

        </#items>

    </table>

</div>

<#else>

</#list>
