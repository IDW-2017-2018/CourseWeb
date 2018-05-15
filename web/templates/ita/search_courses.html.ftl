<div class="filter">
    
    <h1 class="title">FILTRI</h1>
    
    <div class="formcontainer">
        
      <form action="searchcourses?lang=${lang}" method="POST">
		

			<div class="fieldcontainerleft">
				
			
            <label class="label" for="nome">Nome</label>
            <input class="field" type="text" id="nome" name="nome"/>
			
            <label class="label" for="codice">Codice</label>
            <input class="field" type="text" id="codice" name="codice"/>
	
            <label class="label" for="ssd">SSD</label>
            <input class="field" type="text" id="ssd" name="ssd"/>

            <label class="label" for="semestre">Semestre</label>
            <select class="field" name="semestre">
			    <option value="---">---</option>
			    <option value="1">1</option>
			    <option value="2">2</option>
		    </select>

			</div>


			<div class="fieldcontainerright">
				
			
            <label class="label" for="docente">Docente</label>
            <input class="field" type="text" id="docente" name="docente"/>
			
            <label class="label" for="lingua">Lingua</label>
            <select class="field" name="lingua" >
			    <option value="---">---</option>
			    <option value="italiano">Italiano</option>
			    <option value="inglese">Inglese</option>
		    </select>
	
            <label class="label" for="corsi_laurea">Corsi di Laurea</label>
            <input class="field" type="text" id="corsi_laurea" name="corsi_laurea"/>
							
			</div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="login" value="CERCA"/>
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