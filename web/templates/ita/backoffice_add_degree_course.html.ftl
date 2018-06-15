
<div class="filter">
    
    <h1 class="title">AGGIUNTA RELAZIONE CON CORSO LAUREA</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_degree_course" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" disabled="disabled" placeholder="${corso.nome}"/>

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="corso_laurea_nome">Corso di Laurea</label>
                <select class="field" name="corso_laurea_nome">
                <#list items>
                	<#items as item>
                    <option value="${item.nome}">${item.nome}</option>
                    </#items>
                <#else>
				</#list>
                </select>

                <label class="label" for="numero_cfu">CFU</label>
                <input class="field" type="text" id="numero_cfu" name="numero_cfu"/>

                <label class="label" for="tipo_cfu">Tipo CFU</label>
                <select class="field" name="tipo_cfu">
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    <option value="F">F</option>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_corso_laurea_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
