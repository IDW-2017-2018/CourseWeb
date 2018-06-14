
<#list items>

<div class="tablecontainer">

    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">MATERIALI ASSOCIATI</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">NOME</th>
            <th class="thresult">DESCRIZIONE</th>
            <th class="thresult">DIMENSIONE</th>
            <th class="thresult">ELIMINA</th>

        </tr>

        <#items as item>

        <tr class="trresult-list">

            <td class="tdresult-list">${item.nome}</td>
            <td class="tdresult-list">${item.descrizione}</td>
            <td class="tdresult-list">${item.dimensione}</td>
            <td class="tdresult-list"><a href="backofficeeditcourse?id=${id}&lang=${lang}&item=${item.id}&elimina_materiale_action=true&action=delete_check" class="linkresultmod">ELIMINA</a></td>

        </tr>

        </#items>

    </table>

</div>

<#else>

</#list>
