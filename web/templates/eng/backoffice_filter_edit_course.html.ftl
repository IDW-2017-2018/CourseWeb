<div class="helper">
    
    <div class="helpertext">
        
        <p><b>EDIT COURSE</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
          <li>click of <b>EDIT</b> alongside the course to select him and open the edit page of the selected course</li>
          <li>NOTE: use the fields (also together) in the form FILTERS to filter the desidered course's research</li>
        </ul>
        
    </div>

</div>

<#if (session.getAttribute('utente').tipoUtente == "amministratore")>
<div class="filter">
    
    <h1 class="title">FILTERS</h1>
    
    <div class="formcontainer">
        
      <form action="backofficecourse?lang=${lang}&action=edit_course" method="POST">
        

            <div class="fieldcontainerleft">
                
            
            <label class="label" for="corso_nome">Name</label>
            <input class="field" type="text" id="corso_nome" name="corso_nome"/>
            
            <label class="label" for="corso_codice">Code</label>
            <input class="field" type="text" id="corso_codice" name="corso_codice"/>
    
            <label class="label" for="corso_ssd">SSD</label>
            <input class="field" type="text" id="corso_ssd" name="corso_ssd"/>


            </div>


            <div class="fieldcontainerright">
                
            
            <label class="label" for="corso_docente">Teachers</label>
            <select class="field" name="corso_docente">
                <option value="---">---</option>
            <#list docenti>
                <#items as docente>
                <option value="${docente.id}">${strip_slashes(docente.cognome)}</option>
                </#items>
            <#else>
            </#list>
            </select>
    
            <label class="label" for="corso_lingua">Language</label>
            <select class="field" name="corso_lingua">
                <option value="---">---</option>
                <option value="italiano">Italian</option>
                <option value="inglese">English</option>
            </select>
            
            <label class="label" for="corso_corsi_laurea">Degrees</label>
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
            <input class="filterbutton" type="submit" name="filtra" value="SEARCH"/>
        </div>

      </form>

    </div>

</div>
</#if>

<#list corsi>

<div class="tablecontainer">
    
    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">COURSES</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">CODE</th>
            <th class="thresult" colspan="2">NAME</th>
            <th class="thresult">TEACHERS</th>
            <th class="thresult">SSD</th>
            <th class="thresult">YEAR</th>
            <th class="thresult">EDIT</th>

        </tr>

        <#items as corso>

        <tr class="trresult-list">

            <td class="tdresult-list" colspan="2">${strip_slashes(corso.codice)}</td>
            <td class="tdresult-list">${strip_slashes(corso.nome)}</td>
            <td class="tdresult-list">${strip_slashes(corso.courseTeachers())}</td>
            <td class="tdresult-list">${strip_slashes(corso.SSD)}</td>
            <td class="tdresult-list">${strip_slashes(corso.anno)}</td>
            <td class="tdresult-list"><a href="backofficecourse?lang=${lang}&action=edit_course&id=${corso.id}" class="linkresultmod">EDIT</a></td>
            
        </tr>

        </#items>

    </table>

</div>

<#else>

    <h1 class="no_results">NO RESULTS</h1>

</#list>
