
<#list items>

<div class="tablecontainer">

    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">LIBRI DI TESTO ASSOCIATI</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">AUTORE</th>
            <th class="thresult">TITOLO</th>
            <th class="thresult">VOLUME</th>
            <th class="thresult">ANNO</th>
            <th class="thresult">ELIMINA</th>

        </tr>

        <#items as item>

        <tr class="trresult-list">

            <td class="tdresult-list" >${item.autore}</td>
            <td class="tdresult-list" >${item.titolo}</td>
            <td class="tdresult-list" >${item.volume}</td>
            <td class="tdresult-list" >${item.anno}</td>
            <td class="tdresult-list"><a href="backofficeeditcourse?id=${id}&lang=${lang}&item=${item.id}&elimina_libro_testo_action=true&action=delete_check" class="linkresultmod">ELIMINA</a></td>

        </tr>

        </#items>

    </table>

</div>

<#else>

</#list>
