
<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="tablecontainer">
    
    <table class="tableresult">

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">BASIC DATA</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="2">NAME</th>
        <th class="thresult">YEAR</th>
        <th class="thresult">CODE</th>
        <th class="thresult">SSD</th>
        <th class="thresult">LANGUAGE</th>
        <th class="thresult">SEMESTER</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="2">${strip_slashes(corso.nome)}</td>
        <td class="tdresult">${strip_slashes(corso.anno)}</td>
        <td class="tdresult">${strip_slashes(corso.codice)}</td>
        <td class="tdresult">${strip_slashes(corso.SSD)}</td>
        <td class="tdresult">${strip_slashes(corso.lingua)}</td>
        <td class="tdresult">${strip_slashes(corso.semestre)}</td>

    </tr>

<#list corso_anni>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">COURSE PAGE VERSIONS</h1></th>

    </tr>

   <#items as corso_anno>

    <tr class="trresult-list">

        <td class="tdresult" colspan="7"><a class="linkresult" href="course?lang=${lang}&id=${corso_anno.id}">${corso_anno.anno}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

<#list docenti>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">LIST OF TEACHERS</h1></th>

    </tr>

   <#items as docente>

    <tr class="trresult-list">

        <td class="tdresult-list" colspan="7">${strip_slashes(docente.nome)}&nbsp;${strip_slashes(docente.cognome)}</td>

    </tr>

    </#items>
    
    <#else>

</#list>
    
    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">COURSE DESCRIPTION</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="7">PREREQUISITES</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7"><pre>${strip_slashes(corso.prerequisiti)}</pre></td>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="7">COURSE OBJECTIVES</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7"><pre>${strip_slashes(corso.obiettivi)}</pre></td>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="7">ASSESSMENT METHODS</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7"><pre>${strip_slashes(corso.modEsame)}</pre></td>

    </tr>

     <tr class="trresult">

        <th class="thresult" colspan="7">TEACHING METHODS</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7"><pre>${strip_slashes(corso.modInsegnamento)}</pre></td>

    </tr>

     <tr class="trresult">

        <th class="thresult" colspan="7">SILLABUS</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7"><pre>${strip_slashes(corso.sillabo)}</pre></td>

    </tr>

<#list corsi_laurea>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">DEGREE COURSES</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="5">NAME</th>
        <th class="thresult">CFU</th>
        <th class="thresult">CFU TYPE</th>

    </tr>

    <#items as corso_laurea>

     <tr class="trresult-list">

        <td class="tdresult-list" colspan="5">${strip_slashes(corso_laurea.nome)}</td>
        <td class="tdresult-list">${corso_laurea.numero_cfu}</td>
        <td class="tdresult-list">${corso_laurea.tipo_cfu}</td>

    </tr>

    </#items>
    
    <#else>

</#list>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">DUBLINO'S DESCRIPTORS</h1></th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7"><pre>${strip_slashes(corso.descrittoriDublino)}</pre></td>

    </tr>


<#list libri_testo>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">TEXTBOOKS</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult">AUTOR</th>
        <th class="thresult" colspan="2">TITLE</th>
        <th class="thresult">VOLUME</th>
        <th class="thresult">YEAR</th>
        <th class="thresult">EDITOR</th>
        <th class="thresult">LINK</th>

    </tr>

    <#items as libro>

     <tr class="trresult-list">

        <td class="tdresult-list">${strip_slashes(libro.autore)}</td>
        <td class="tdresult-list" colspan="2">${strip_slashes(libro.titolo)}</td>
        <td class="tdresult-list">${strip_slashes(libro.volume)}</td>
        <td class="tdresult-list">${libro.anno}</td>
        <td class="tdresult-list">${strip_slashes(libro.editore)}</td>
        <td class="tdresult-list"><a class="linkresult" href="http://${strip_slashes(libro.link)}">${strip_slashes(libro.link)}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">RELATIONSHIPS WITH OTHER COURSES</h1></th>

    </tr>

<#list corsi_propedeutici>

    <tr class="trresult">

        <th class="thresult" colspan="7">PROPAEDEUTIC COURSES</th>

    </tr>
    
    <#items as corso_propedeutico>

     <tr class="trresult">

        <td class="tdresult" colspan="7"><a class="linkresult" href="course?lang=${lang}&id=${corso_propedeutico.id}">${strip_slashes(corso_propedeutico.nome)}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

<#list corsi_mutuati>

    <tr class="trresult">

        <th class="thresult" colspan="7">SAME AS COURSES</th>

    </tr>
    
    <#items as corso_mutuato>

     <tr class="trresult">

        <td class="tdresult" colspan="7"><a class="linkresult" href="course?lang=${lang}&id=${corso_mutuato.id}">${strip_slashes(corso_mutuato.nome)}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

<#list moduli>

    <tr class="trresult">

        <th class="thresult" colspan="7">MODULES</th>

    </tr>
    
    <#items as modulo>

     <tr class="trresult">

        <td class="tdresult" colspan="7"><a class="linkresult" href="course?lang=${lang}&id=${modulo.id}">${strip_slashes(modulo.nome)}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">EXTERNAL LINKS</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="3">HOMEPAGE</th>
        <th class="thresult" colspan="2">EXTERNAL RESOURCES</th>
        <th class="thresult" colspan="2">FORUM / eLEARNING</th>

    </tr>

     <tr class="trresult">

        <td class="tdresult" colspan="3"><a class="linkresult" href="http://${strip_slashes(corso.linkHomepageCorso)}">${strip_slashes(corso.linkHomepageCorso)}</a></td>
        <td class="tdresult" colspan="2"><a class="linkresult" href="http://${strip_slashes(corso.linkRisorseEsterne)}">${strip_slashes(corso.linkRisorseEsterne)}</a></td>
        <td class="tdresult" colspan="2"><a class="linkresult" href="http://${strip_slashes(corso.linkForum)}">${strip_slashes(corso.linkForum)}</a></td>

    </tr>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">NOTES</h1></th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7"><pre>${strip_slashes(corso.note)}</pre></td>

    </tr>

<#list corso_materiali>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">MATERIALS</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult">DOWNLOAD</th>
        <th class="thresult" colspan="3">NAME</th>
        <th class="thresult" colspan="2">DESCRIPTION</th>
        <th class="thresult">DIMENSION</th>

    </tr>

    <#items as materiale>

     <tr class="trresult-list">

        <td class="tdresult-list"><a class="linkresult" href="course?lang=${lang}&id=${corso.id}&materiale_id=${materiale.id}&download=true">DOWNLOAD</a></td>
        <td class="tdresult-list" colspan="3">${strip_slashes(materiale.nome)}</td>
        <td class="tdresult-list" colspan="2">${strip_slashes(materiale.descrizione)}</td>
        <td class="tdresult-list">${materiale.dimensione}</td>

    </tr>

    </#items>
    
    <#else>

</#list>


</table>

</div>