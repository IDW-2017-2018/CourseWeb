
<#list items>

<div class="tablecontainer">
    
    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">LIST MODULES</h1></th>

        </tr>

        <tr class="trresult">
            
            <th class="thresult">CODE</th>
            <th class="thresult">YEAR</th>
            <th class="thresult">NAME</th>
            <th class="thresult">SSD</th>
            <th class="thresult">DELETE</th>

        </tr>

        <#items as item>

        <tr class="trresult-list">

            <td class="tdresult-list" >${item.codice}</td>
            <td class="tdresult-list" >${item.anno}</td>
            <td class="tdresult-list" >${item.nome}</td>
            <td class="tdresult-list" >${item.SSD}</td>
            <td class="tdresult-list"><a href="backofficeeditcourse?id=${id}&lang=${lang}&item=${item.id}&elimina_modulo_action=true&action=delete_check" class="linkresultmod">DELETE</a></td>
        </tr>

        </#items>

    </table>

</div>

<#else>

</#list>
