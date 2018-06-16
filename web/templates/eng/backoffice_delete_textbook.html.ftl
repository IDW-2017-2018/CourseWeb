
<#list items>

<div class="tablecontainer">

    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">LIST TEXTBOOKS</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">AUTHOR</th>
            <th class="thresult">TITLE</th>
            <th class="thresult">VOLUME</th>
            <th class="thresult">YEAR</th>
            <th class="thresult">DELETE</th>

        </tr>

        <#items as item>

        <tr class="trresult-list">

            <td class="tdresult-list" >${strip_slashes(item.autore)}</td>
            <td class="tdresult-list" >${strip_slashes(item.titolo)}</td>
            <td class="tdresult-list" >${strip_slashes(item.volume)}</td>
            <td class="tdresult-list" >${strip_slashes(item.anno)}</td>
            <td class="tdresult-list"><a href="backofficeeditcourse?id=${id}&lang=${lang}&item=${item.id}&name=elimina_libro_testo_action&action=delete_check" class="linkresultmod">DELETE</a></td>

        </tr>

        </#items>

    </table>

</div>

<#else>

</#list>
