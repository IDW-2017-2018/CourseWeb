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
                
            
            <label class="label" for="corso_docente">Docente</label>
            <input class="field" type="text" id="corso_docente" name="corso_docente"/>
    
            <label class="label" for="corso_corsi_laurea">Corsi di Laurea</label>
            <input class="field" type="text" id="corso_corsi_laurea" name="corso_corsi_laurea"/>
                   
            <label class="label" for="corso_lingua">Lingua</label>
                <select class="field" name="corso_lingua">
                    <option value="---">---</option>
                    <option value="italiano">Italiano</option>
                    <option value="inglese">Inglese</option>
                </select>

            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="filtra" value="CERCA"/>
        </div>

      </form>

    </div>

</div>


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
            <td class="tdresult-list">${strip_slashes(corso.showTeachers)}</td>
            <td class="tdresult-list">${strip_slashes(corso.SSD)}</td>
            <td class="tdresult-list">${strip_slashes(corso.anno)}</td>
            <td class="tdresult-list"><a href="backofficecourse?lang=${lang}&action=edit_course&id=${corso.id}" class="linkresultmod">MODIFICA</a></td>
            
        </tr>

        </#items>

    </table>

</div>

<#else>

</#list>
