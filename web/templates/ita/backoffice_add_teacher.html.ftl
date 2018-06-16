
<div class="filter">
    
    <h1 class="title">AGGIUNTA RELAZIONE CON DOCENTE</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_teacher" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome"" placeholder="${strip_slashes(corso.nome)}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="utente_nome">Docente</label>
                <select class="field" name="utente_nome">
                <#list items>
                    <#items as item>
                    <option value="${item.id}">${strip_slashes(item.nome)}&nbsp;${strip_slashes(item.cognome)}</option>
                    </#items>
                <#else>
				</#list>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_docente_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
