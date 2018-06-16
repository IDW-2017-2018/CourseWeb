
<div class="filter">
    
    <h1 class="title">AGGIUNTA RELAZIONE CON CORSO PROPEDEUTICO</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_propaedeutic_course" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${strip_slashes(corso.nome)}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="corso_nome">Corso Propedeutico</label>
                <select class="field" name="corso_nome">
                <#list items>
                    <#items as item>
                    <option value="${item.id}">${strip_slashes(item.nome)}</option>
                    </#items>
                <#else>
				</#list>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_corso_propedeutico_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
