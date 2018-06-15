
<div class="filter">
    
    <h1 class="title">ADD RELATION WITH TEACHER</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_teacher" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Course</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome"" placeholder="${corso.nome}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="utente_nome">Teacher</label>
                <select class="field" name="utente_nome">
                <#list items>
                    <#items as item>
                    <option value="${item.id}">${item.nome}&nbsp;${item.cognome}</option>
                    </#items>
                <#else>
				</#list>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_docente_action" value="ADD"/>
        </div>

      </form>

    </div>

</div>
