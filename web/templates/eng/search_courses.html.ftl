<div class="filter">
    
    <h1 class="title">FILTERS</h1>
    
    <div class="formcontainer">
        
      <form action="searchcourses?lang=${lang}" method="POST">
		

			<div class="fieldcontainerleft">
				
			
            <label class="label" for="corso_nome">Name</label>
            <input class="field" type="text" id="corso_nome" name="corso_nome"/>
			
            <label class="label" for="corso_codice">Code</label>
            <input class="field" type="text" id="corso_codice" name="corso_codice"/>
	
            <label class="label" for="corso_ssd">SSD</label>
            <input class="field" type="text" id="corso_ssd" name="corso_ssd"/>

            <label class="label" for="corso_semestre">Semester</label>
            <select class="field" name="corso_semestre">
			    <option value="---">---</option>
			    <option value="1">1</option>
			    <option value="2">2</option>
		    </select>

			</div>


			<div class="fieldcontainerright">
				
			
            <label class="label" for="corso_docente">Professor</label>
            <input class="field" type="text" id="corso_docente" name="corso_docente"/>
			
            <label class="label" for="corso_lingua">Language</label>
            <select class="field" name="corso_lingua" >
			    <option value="---">---</option>
			    <option value="italiano">Italian</option>
			    <option value="inglese">English</option>
		    </select>
	
            <label class="label" for="corso_corsi_laurea">Degree Courses</label>
            <input class="field" type="text" id="corso_corsi_laurea" name="corso_corsi_laurea"/>
							
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
			    <th class="thresult">CODE</th>
			    <th class="thresult">NAME</th>
			    <th class="thresult">PROFESSOR</th>
			    <th class="thresult">LANGUAGE</th>
			    <th class="thresult">SEMESTER</th>
			    <th class="thresult">SSD</th>
			</tr>
		
			<#items as corso>

			<tr class="trresult">
				<td class="tdresult">${strip_slashes(corso.codice)}</td>
				<td class="tdresult"><a class="linkresult" href="course?lang=${lang}&id=${corso.id}">${strip_slashes(corso.nome)}</a></td>
				<td class="tdresult">${strip_slashes(corso.showTeachers)}</td>
				<td class="tdresult">${strip_slashes(corso.lingua)}</td>
				<td class="tdresult">${strip_slashes(corso.semestre)}</td>
				<td class="tdresult">${strip_slashes(corso.SSD)}</td>
			</tr>

			</#items>

			</table>

		</div>

	<#else>

	<h1 class="no_results">NO RESULTS</h1>

</#list>
	  
