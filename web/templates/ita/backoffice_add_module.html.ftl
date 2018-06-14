
<div class="filter">
    
    <h1 class="title">AGGIUNTA RELAZIONE CON MODULO </h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=edit_module" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${corso.nome}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="corso_nome">Modulo</label>
                <select class="field" name="corso_nome">
                <#list items>
                    <#items as item>
                    <option value="${item.id}">${item.nome}</option>
                    </#items>
                <#else>
				</#list>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_modulo_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
