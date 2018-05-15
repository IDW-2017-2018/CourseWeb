<div class="filter">
    
    <h1 class="title">FILTERS</h1>
    
    <div class="formcontainer">
        
      <form action="searchcourses?lang=${lang}" method="POST">
		

			<div class="fieldcontainerleft">
				
			
            <label class="label" for="nome">Name</label>
            <input class="field" type="text" id="nome" name="nome"/>
			
            <label class="label" for="codice">Code</label>
            <input class="field" type="text" id="codice" name="codice"/>
	
            <label class="label" for="ssd">SSD</label>
            <input class="field" type="text" id="ssd" name="ssd"/>

            <label class="label" for="semestre">Semester</label>
            <select class="field" name="semestre">
			    <option value="---">---</option>
			    <option value="1">1</option>
			    <option value="2">2</option>
		    </select>

			</div>


			<div class="fieldcontainerright">
				
			
            <label class="label" for="docente">Professor</label>
            <input class="field" type="text" id="docente" name="docente"/>
			
            <label class="label" for="lingua">Language</label>
            <select class="field" name="lingua" >
			    <option value="---">---</option>
			    <option value="italiano">Italian</option>
			    <option value="inglese">English</option>
		    </select>
	
            <label class="label" for="corsi_laurea">Degree Courses</label>
            <input class="field" type="text" id="corsi_laurea" name="corsi_laurea"/>
							
			</div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="login" value="SEARCH"/>
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
				<td class="tdresult">${corso.codice}</td>
				<td class="tdresult"><a class="linkresult" href="">${corso.nome}</a></td>
				<td class="tdresult">${corso.docente}</td>
				<td class="tdresult">${corso.lingua}</td>
				<td class="tdresult">${corso.semestre}</td>
				<td class="tdresult">${corso.ssd}</td>
			</tr>

			</#items>

			</table>

		</div>

	<#else>

</#list>
	  
