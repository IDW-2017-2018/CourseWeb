
<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="tablecontainer">
    
    <table class="tableresult">

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">DATI DI BASE</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="2">NOME</th>
        <th class="thresult">ANNO</th>
        <th class="thresult">CODICE</th>
        <th class="thresult">SSD</th>
        <th class="thresult">LINGUA</th>
        <th class="thresult">SEMESTRE</th>

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

        <th class="thresultfront" colspan="7"><h1 class="title">VERSIONI DELLA PAGINA DEL CORSO</h1></th>

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

        <th class="thresultfront" colspan="7"><h1 class="title">LISTA DOCENTI TITOLARI</h1></th>

    </tr>

   <#items as docente>

    <tr class="trresult-list">

        <td class="tdresult-list" colspan="7">${strip_slashes(docente.nome)}&nbsp;${strip_slashes(docente.cognome)}</td>

    </tr>

    </#items>
    
    <#else>

</#list>
    
    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">DESCRIZIONE DEL CORSO</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="7">PREREQUISITI</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7">${strip_slashes(corso.prerequisiti)}</td>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="7">OBIETTIVI DI APPRENDIMENTO</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7">${strip_slashes(corso.obiettivi)}</td>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="7">MODALITA' D'ESAME</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7">${strip_slashes(corso.modEsame)}</td>

    </tr>

     <tr class="trresult">

        <th class="thresult" colspan="7">MODALITA' D'INSEGNAMENTO</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7">${strip_slashes(corso.modInsegnamento)}</td>

    </tr>

     <tr class="trresult">

        <th class="thresult" colspan="7">SILLABO / PROGRAMMA ANALITICO</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7">${strip_slashes(corso.sillabo)}</td>

    </tr>

<#list corsi_laurea>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">CORSI DI LAUREA PER I QUALI E' DISPONIBILE</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="5">NOME</th>
        <th class="thresult">CFU</th>
        <th class="thresult">TIPOLOGIA CFU</th>

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

        <th class="thresultfront" colspan="7"><h1 class="title">DESCRITTORI DI DUBLINO</h1></th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7">${strip_slashes(corso.descrittoriDublino)}</td>

    </tr>


<#list libri_testo>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">LIBRI DI TESTO</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult">AUTORE</th>
        <th class="thresult" colspan="2">TITOLO</th>
        <th class="thresult">VOLUME</th>
        <th class="thresult">ANNO</th>
        <th class="thresult">EDITORE</th>
        <th class="thresult">LINK WEB</th>

    </tr>

    <#items as libro>

     <tr class="trresult-list">

        <td class="tdresult-list">${strip_slashes(libro.autore)}</td>
        <td class="tdresult-list" colspan="2">${strip_slashes(libro.titolo)}</td>
        <td class="tdresult-list">${strip_slashes(libro.volume)}</td>
        <td class="tdresult-list">${libro.anno}</td>
        <td class="tdresult-list">${strip_slashes(libro.editore)}</td>
        <td class="tdresult-list"><a class="linkresult" href="">${strip_slashes(libro.link)}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">RELAZIONI CON ALTRI INSEGNAMENTI</h1></th>

    </tr>

<#list corsi_propedeutici>

    <tr class="trresult">

        <th class="thresult" colspan="7">CORSI PROPEDEUTICI</th>

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

        <th class="thresult" colspan="7">CORSI MUTUATI</th>

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

        <th class="thresult" colspan="7">MODULI</th>

    </tr>
    
    <#items as modulo>

     <tr class="trresult">

        <td class="tdresult" colspan="7"><a class="linkresult" href="course?lang=${lang}&id=${modulo.id}">${strip_slashes(modulo.nome)}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">COLLEGAMENTI ESTERNI</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="3">HOMEPAGE DEL CORSO</th>
        <th class="thresult" colspan="2">RISORSE ESTERNE</th>
        <th class="thresult" colspan="2">FORUM / eLEARNING</th>

    </tr>

     <tr class="trresult">

        <td class="tdresult" colspan="3"><a class="linkresult" href="">${strip_slashes(corso.linkHomepageCorso)}</a></td>
        <td class="tdresult" colspan="2"><a class="linkresult" href="">${strip_slashes(corso.linkRisorseEsterne)}</a></td>
        <td class="tdresult" colspan="2"><a class="linkresult" href="">${strip_slashes(corso.linkForum)}</a></td>

    </tr>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">NOTE</h1></th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="7">${strip_slashes(corso.note)}</td>

    </tr>

<#list corso_materiali>

    <tr class="trresult">

        <th class="thresultfront" colspan="7"><h1 class="title">MATERIALE DEL CORSO</h1></th>

    </tr>

    <tr class="trresult">
        
        <th class="thresult">SCARICA</th>
        <th class="thresult" colspan="3">NOME</th>
        <th class="thresult" colspan="2">DESCRIZIONE</th>
        <th class="thresult">DIMENSIONI</th>

    </tr>

    <#items as materiale>

     <tr class="trresult-list">
        
        <td class="tdresult-list"><a class="linkresult" href="course?lang=${lang}&id=${corso.id}&materiale_id=${materiale.id}&download=true">SCARICA</a></td>
        <td class="tdresult-list" colspan="3">${strip_slashes(materiale.nome)}</td>
        <td class="tdresult-list" colspan="2">${strip_slashes(materiale.descrizione)}</td>
        <td class="tdresult-list">${materiale.dimensione}</td>

    </tr>

    </#items>
    
    <#else>

</#list>


</table>

</div>