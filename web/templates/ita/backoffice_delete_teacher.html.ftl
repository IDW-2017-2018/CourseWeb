
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

            <td class="tdresult-list" >${item.nome}</td>
            <td class="tdresult-list" >${item.cognome}</td>
            <td class="tdresult-list"><a href="backofficeeditcourse?id=${id}&lang=${lang}&item=${item.id}&action=delete&elimina_docente_action=true" class="linkresultmod">ELIMINA</a></td>
            
        </tr>

        </#items>

    </table>

</div>

<#else>

</#list>
