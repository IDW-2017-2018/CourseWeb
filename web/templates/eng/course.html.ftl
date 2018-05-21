<div class="tablecontainer">
    
    <table class="tableresult">

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">BASIC DATA</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="2">NAME</th>
        <th class="thresult">CODE</th>
        <th class="thresult">SSD</th>
        <th class="thresult">LANGUAGE</th>
        <th class="thresult">SEMESTER</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="2">${corso.nome}</td>
        <td class="tdresult">${corso.codice}</td>
        <td class="tdresult">${corso.SSD}</td>
        <td class="tdresult">${corso.lingua}</td>
        <td class="tdresult">${corso.semestre}</td>

    </tr>

<#list corso_anni>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">PAGE VERSIONS</h1></th>

    </tr>

   <#items as corso_anno>

    <tr class="trresult-list">

        <td class="tdresult" colspan="6"><a class="linkresult" href="course?lang=${lang}&id=${corso_anno.id}">${corso_anno.anno}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

<#list docenti>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">PROFESSORS</h1></th>

    </tr>

   <#items as docente>

    <tr class="trresult-list">

        <td class="tdresult-list" colspan="6">${docente.nome}</td>

    </tr>

    </#items>
    
    <#else>

</#list>
    
    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">INFO COURSE</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="6">PREREQUISITES</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.prerequisiti}</td>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="6">ACHIVES</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.obiettivi}</td>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="6">MOD EXAM</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.mod_esame}</td>

    </tr>

     <tr class="trresult">

        <th class="thresult" colspan="6">MOD TEACH</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.insegnamento}</td>

    </tr>

     <tr class="trresult">

        <th class="thresult" colspan="6">SILLABO ENG</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.sillabo}</td>

    </tr>

<#list corsi_laurea>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">DEGREE COURSES</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="4">NAME</th>
        <th class="thresult">CFU</th>
        <th class="thresult">CFU TYPE</th>

    </tr>

    <#items as corso_laurea>

     <tr class="trresult-list">

        <td class="tdresult-list" colspan="4">${corso_laurea.nome}</td>
        <td class="tdresult-list">${corso_laurea.numero_cfu}</td>
        <td class="tdresult-list">${corso_laurea.tipo_cfu}</td>

    </tr>

    </#items>
    
    <#else>

</#list>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">DUBLINO'S DESCRIPTORS</h1></th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.descrittori_dublino}</td>

    </tr>


<#list libri_testo>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">BOOKS</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult">AUTOR</th>
        <th class="thresult">TITLEth>
        <th class="thresult">VOLUME</th>
        <th class="thresult">YEAR</th>
        <th class="thresult">EDITOR</th>
        <th class="thresult">LINK ENG</th>

    </tr>

    <#items as libro>

     <tr class="trresult-list">

        <td class="tdresult-list">${libro.autore}</td>
        <td class="tdresult-list">${libro.titolo}</td>
        <td class="tdresult-list">${libro.volume}</td>
        <td class="tdresult-list">${libro.anno}</td>
        <td class="tdresult-list">${libro.editore}</td>
        <td class="tdresult-list"><a class="linkresult" href="">${libro.link}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">RELATIONSHIPS</h1></th>

    </tr>

<#list corsi_propedeutici>

    <tr class="trresult">

        <th class="thresult" colspan="6">PROPEDEUTICS COURSES</th>

    </tr>
    
    <#items as corso_propedeutico>

     <tr class="trresult">

        <td class="tdresult" colspan="6"><a class="linkresult" href="course?lang=${lang}&id=${corso_propedeutico.id}">${corso_propedeutico.nome}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

<#list corsi_mutuati>

    <tr class="trresult">

        <th class="thresult" colspan="6">MUTUATS COURSES</th>

    </tr>
    
    <#items as corso_mutuato>

     <tr class="trresult">

        <td class="tdresult" colspan="6"><a class="linkresult" href="course?lang=${lang}&id=${corso_mutuato.id}">${corso_mutuato.nome}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

<#list corsi_integrati>

    <tr class="trresult">

        <th class="thresult" colspan="6">MODULS</th>

    </tr>
    
    <#items as corso_integrato>

     <tr class="trresult">

        <td class="tdresult" colspan="6"><a class="linkresult" href="course?lang=${lang}&id=${corso_integrato.id}">${corso_integrato.nome}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">EXTERNAL LINKS</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="2">HOMEPAGE</th>
        <th class="thresult" colspan="2">EXTERNAL RESOURCES</th>
        <th class="thresult" colspan="2">FORUM / eLEARNING ENG</th>

    </tr>

     <tr class="trresult">

        <td class="tdresult" colspan="2"><a class="linkresult" href="">${corso.link_homepage_corso}</a></td>
        <td class="tdresult" colspan="2"><a class="linkresult" href="">${corso.link_risorse_esterne}</a></td>
        <td class="tdresult" colspan="2"><a class="linkresult" href="">${corso.link_forum}</a></td>

    </tr>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">NOTES</h1></th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.note}</td>

    </tr>

<#list corso_materiali>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">MATERIALS</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="3">NAME</th>
        <th class="thresult" colspan="2">DESCRIPTION</th>
        <th class="thresult">DIMENSION</th>

    </tr>

    <#items as materiale>

     <tr class="trresult-list">

        <td class="tdresult-list" colspan="3"><a class="linkresult" href="">${materiale.nome}</a></td>
        <td class="tdresult-list" colspan="2">${materiale.descrizione}</td>
        <td class="tdresult-list">${materiale.dimensione}</td>

    </tr>

    </#items>
    
    <#else>

</#list>


</table>

</div>