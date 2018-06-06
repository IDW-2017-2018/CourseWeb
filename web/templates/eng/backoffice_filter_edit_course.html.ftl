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
                
            
            <label class="label" for="corso_docente">Teacher</label>
            <input class="field" type="text" id="corso_docente" name="corso_docente"/>
    
            <label class="label" for="corso_corsi_laurea">Degree Courses</label>
            <input class="field" type="text" id="corso_corsi_laurea" name="corso_corsi_laurea"/>
                   
            <label class="label" for="corso_lingua">Language</label>
                <select class="field" name="corso_lingua">
                    <option value="---">---</option>
                    <option value="italiano">Italian</option>
                    <option value="inglese">English</option>
                </select>

            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="filtra" value="SEARCH"/>
        </div>

      </form>

    </div>

</div>


<#list corsi>

<div class="tablecontainer">
    
    <table class="tableresult">

        <tr class="trresult">

            <th class="thresultfront" colspan="7"><h1 class="title">COURSES</h1></th>

        </tr>

        <tr class="trresult">

            <th class="thresult">CODE</th>
            <th class="thresult" colspan="2">NAME</th>
            <th class="thresult">SSD</th>
            <th class="thresult">YEAR</th>
            <th class="thresult">EDIT</th>

        </tr>

        <#items as corso>

        <tr class="trresult-list">

            <td class="tdresult-list" colspan="2">${corso.codice}</td>
            <td class="tdresult-list">${corso.nome}</td>
            <td class="tdresult-list">${corso.SSD}</td>
            <td class="tdresult-list">${corso.anno}</td>
            <td class="tdresult-list"><a href="backofficecourse?lang=${lang}&id=${corso.id}" class="linkresultmod">EDIT</a></td>
            
        </tr>

        </#items>

    </table>

</div>

<#else>

</#list>
