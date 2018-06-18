<div class="helper">
    
    <div class="helpertext">
        
        <p><b>TITOLO</b></p>

        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        <hr>
        <p><b>TITOLO</b><br>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        
    </div>

</div>

<#if (session.getAttribute('utente').tipoUtente == "amministratore")>
<div class="filter">
    
    <h1 class="title">FILTRI</h1>
    
    <div class="formcontainer">
        
      <form action="backofficecourse?lang=${lang}&action=edit_course" method="POST">
        

            <div class="fieldcontainerleft">
                
            
            <label class="label" for="corso_nome">Nome</label>
            <input class="field" type="text" id="corso_nome" name="corso_nome"/>
            
            <label class="label" for="corso_codice">Codice</label>
            <input class="field" type="text" id="corso_codice" name="corso_codice"/>
    
            <label class="label" for="corso_ssd">SSD</label>
            <input class="field" type="text" id="corso_ssd" name="corso_ssd"/>


            </div>


            <div class="fieldcontainerright">
                
            
            <label class="label" for="corso_docente">Docenti</label>
            <select class="field" name="corso_docente">
                <option value="---">---</option>
            <#list docenti>
                <#items as docente>
                <option value="${docente.id}">${strip_slashes(docente.cognome)}</option>
                </#items>
            <#else>
            </#list>
            </select>
    
            <label class="label" for="corso_lingua">Lingua</label>
            <select class="field" name="corso_lingua">
                <option value="---">---</option>
                <option value="italiano">Italiano</option>
                <option value="inglese">Inglese</option>
            </select>
            
            <label class="label" for="corso_corsi_laurea">Corsi di Laurea</label>
            <select class="field" name="corso_corsi_laurea">
                <option value="---">---</option>
            <#list corsilaurea>
                <#items as corsolaurea>
                <option value="${corsolaurea.nome}">${strip_slashes(corsolaurea.nome)}</option>
                </#items>
            <#else>
            </#list>
            </select>
            
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="filtra" value="CERCA"/>
        </div>

      </form>

    </div>

</div>
</#if>

<#list corsi>

<div class="tablecontainer">
    
    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">CORSI</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">CODICE</th>
            <th class="thresult" colspan="2">NOME</th>
            <th class="thresult">DOCENTI</th>
            <th class="thresult">SSD</th>
            <th class="thresult">ANNO</th>
            <th class="thresult">MODIFICA</th>

        </tr>

        <#items as corso>

        <tr class="trresult-list">

            <td class="tdresult-list" colspan="2">${strip_slashes(corso.codice)}</td>
            <td class="tdresult-list">${strip_slashes(corso.nome)}</td>
            <td class="tdresult-list">${strip_slashes(corso.courseTeachers())}</td>
            <td class="tdresult-list">${strip_slashes(corso.SSD)}</td>
            <td class="tdresult-list">${strip_slashes(corso.anno)}</td>
            <td class="tdresult-list"><a href="backofficecourse?lang=${lang}&action=edit_course&id=${corso.id}" class="linkresultmod">MODIFICA</a></td>
            
        </tr>

        </#items>

    </table>

</div>

<#else>
    
    <h1 class="no_results">NESSUN RISULTATO</h1>

</#list>
