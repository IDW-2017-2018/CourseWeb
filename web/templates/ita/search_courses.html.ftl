<div class="filter">
    
    <h1 class="title">FILTRI</h1>
    
    <div class="formcontainer">
        
      <form action="searchcourses?lang=${lang}" method="POST">
		

			<div class="fieldcontainerleft">
				
			
            <label class="label" for="corso_nome">Nome</label>
            <input class="field" type="text" id="corso_nome" name="corso_nome"/>
			
            <label class="label" for="corso_codice">Codice</label>
            <input class="field" type="text" id="corso_codice" name="corso_codice"/>
	
            <label class="label" for="corso_ssd">SSD</label>
            <input class="field" type="text" id="corso_ssd" name="corso_ssd"/>

            <label class="label" for="corso_semestre">Semestre</label>
            <select class="field" name="corso_semestre">
			    <option value="---">---</option>
			    <option value="1">1</option>
			    <option value="2">2</option>
		    </select>

			</div>


			<div class="fieldcontainerright">
				
			
            <label class="label" for="corso_docente">Docente</label>
            <input class="field" type="text" id="corso_docente" name="corso_docente"/>
			
            <label class="label" for="corso_lingua">Lingua</label>
            <select class="field" name="corso_lingua" >
			    <option value="---">---</option>
			    <option value="italiano">Italiano</option>
			    <option value="inglese">Inglese</option>
		    </select>
	
            <label class="label" for="corso_corsi_laurea">Corsi di Laurea</label>
            <input class="field" type="text" id="corso_corsi_laurea" name="corso_corsi_laurea"/>
							
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
				<th class="thresult">CODICE</th>
				<th class="thresult">NOME</th>
				<th class="thresult">DOCENTI</th>
				<th class="thresult">LINGUA</th>
				<th class="thresult">SEMESTRE</th>
				<th class="thresult">SSD</th>
			</tr>
		
			<#items as corso>

			<tr class="trresult">
				<td class="tdresult">${corso.codice}</td>
				<td class="tdresult"><a class="linkresult" href="course?lang=${lang}&id=${corso.id}">${corso.nome}</a></td>
				<td class="tdresult">nomedocente</td>
				<td class="tdresult">${corso.lingua}</td>
				<td class="tdresult">${corso.semestre}</td>
				<td class="tdresult">${corso.SSD}</td>
			</tr>

			</#items>

			</table>

		</div>

	<#else>

	<h1 class="no_results">NESSUN RISULTATO</h1>

</#list>