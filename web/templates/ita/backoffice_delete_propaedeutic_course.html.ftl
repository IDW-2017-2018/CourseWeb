
<#list items>

<div class="tablecontainer">
    
    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">CORSI PROPEDEUTICI ASSOCIATI</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">CODICE</th>
            <th class="thresult">ANNO</th>
            <th class="thresult">NOME</th>
            <th class="thresult">SSD</th>
            <th class="thresult">ELIMINA</th>

        </tr>

        <#items as item>

        <tr class="trresult-list">

            <td class="tdresult-list" >${item.codice}</td>
            <td class="tdresult-list" >${item.anno}</td>
            <td class="tdresult-list" >${item.nome}</td>
            <td class="tdresult-list" >${item.SSD}</td>
            <td class="tdresult-list"><a href="backofficeeditcourse?id=${id}&lang=${lang}&item=${item.id}&name=elimina_corso_propedeutico_action&action=delete_check" class="linkresultmod">ELIMINA</a></td>
        </tr>

        </#items>

    </table>

</div>

<#else>

</#list>
