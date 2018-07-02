<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>DELETE A RELATIONSHIP WITH A MATERIAL</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
          <li>click in link <b>DELETE</b> alongside a material's relationship to select it and go in deletion's confirmation page</li>
        </ul>
        
    </div>

</div>

<#list items>

<div class="tablecontainer">

    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">LIST MATERIAL</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">NAME</th>
            <th class="thresult">DESCRIPTION</th>
            <th class="thresult">SIZE</th>
            <th class="thresult">DELETE</th>

        </tr>

        <#items as item>

        <tr class="trresult-list">

            <td class="tdresult-list">${strip_slashes(item.nome)}</td>
            <td class="tdresult-list">${strip_slashes(item.descrizione)}</td>
            <td class="tdresult-list">${item.dimensione}</td>
            <td class="tdresult-list"><a href="backofficeeditcourse?id=${id}&lang=${lang}&item=${item.id}&name=elimina_materiale_action&action=delete_check" class="linkresultmod">DELETE</a></td>

        </tr>

        </#items>

    </table>

</div>

<#else>

    <h1 class="no_results">NO RESULT</h1>

</#list>
