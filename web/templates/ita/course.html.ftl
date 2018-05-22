<div class="tablecontainer">
    
    <table class="tableresult">

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">DATI DI BASE</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="2">NOME</th>
        <th class="thresult">CODICE</th>
        <th class="thresult">SSD</th>
        <th class="thresult">LINGUA</th>
        <th class="thresult">SEMESTRE</th>

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

        <th class="thresultfront" colspan="6"><h1 class="title">VERSIONI DELLA PAGINA DEL CORSO</h1></th>

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

        <th class="thresultfront" colspan="6"><h1 class="title">LISTA DOCENTI TITOLARI</h1></th>

    </tr>

   <#items as docente>

    <tr class="trresult-list">

        <td class="tdresult-list" colspan="6">${docente.nome}&nbsp;${docente.cognome}</td>

    </tr>

    </#items>
    
    <#else>

</#list>
    
    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">DESCRIZIONE DEL CORSO</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="6">PREREQUISITI</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.prerequisiti}</td>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="6">OBIETTIVI DI APPRENDIMENTO</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.obiettivi}</td>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="6">MODALITA' D'ESAME</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.modEsame}</td>

    </tr>

     <tr class="trresult">

        <th class="thresult" colspan="6">MODALITA' D'INSEGNAMENTO</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.modInsegnamento}</td>

    </tr>

     <tr class="trresult">

        <th class="thresult" colspan="6">SILLABO / PROGRAMMA ANALITICO</th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.sillabo}</td>

    </tr>

<#list corsi_laurea>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">CORSI DI LAUREA PER I QUALI E' DISPONIBILE</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="4">NOME</th>
        <th class="thresult">CFU</th>
        <th class="thresult">TIPOLOGIA CFU</th>

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

        <th class="thresultfront" colspan="6"><h1 class="title">DESCRITTORI DI DUBLINO</h1></th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.descrittoriDublino}</td>

    </tr>


<#list libri_testo>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">LIBRI DI TESTO</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult">AUTORE</th>
        <th class="thresult">TITOLO</th>
        <th class="thresult">VOLUME</th>
        <th class="thresult">ANNO</th>
        <th class="thresult">EDITORE</th>
        <th class="thresult">LINK WEB</th>

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

        <th class="thresultfront" colspan="6"><h1 class="title">RELAZIONI CON ALTRI INSEGNAMENTI</h1></th>

    </tr>

<#list corsi_propedeutici>

    <tr class="trresult">

        <th class="thresult" colspan="6">CORSI PROPEDEUTICI</th>

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

        <th class="thresult" colspan="6">CORSI MUTUATI</th>

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

        <th class="thresult" colspan="6">MODULI</th>

    </tr>
    
    <#items as corso_integrato>

     <tr class="trresult">

        <td class="tdresult" colspan="6"><a class="linkresult" href="course?lang=${lang}&id=${corso_integrato.id}">${corso_integrato.nome}</a></td>

    </tr>

    </#items>
    
    <#else>

</#list>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">COLLEGAMENTI ESTERNI</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="2">HOMEPAGE DEL CORSO</th>
        <th class="thresult" colspan="2">RISORSE ESTERNE</th>
        <th class="thresult" colspan="2">FORUM / eLEARNING</th>

    </tr>

     <tr class="trresult">

        <td class="tdresult" colspan="2"><a class="linkresult" href="">${corso.linkHomepageCorso}</a></td>
        <td class="tdresult" colspan="2"><a class="linkresult" href="">${corso.linkRisorseEsterne}</a></td>
        <td class="tdresult" colspan="2"><a class="linkresult" href="">${corso.linkForum}</a></td>

    </tr>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">NOTE</h1></th>

    </tr>

    <tr class="trresult">

        <td class="tdresult" colspan="6">${corso.note}</td>

    </tr>

<#list corso_materiali>

    <tr class="trresult">

        <th class="thresultfront" colspan="6"><h1 class="title">MATERIALE DEL CORSO</h1></th>

    </tr>

    <tr class="trresult">

        <th class="thresult" colspan="3">NOME</th>
        <th class="thresult" colspan="2">DESCRIZIONE</th>
        <th class="thresult">DIMENSIONI</th>

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