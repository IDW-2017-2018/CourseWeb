
<div class="filter">
    
    <h1 class="title">AGGIUNTA RELAZIONE CON CORSO MUTUATO</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_same_as_course" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${corso.nome}" disabled="disabled"/>

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="corsi_mutuati">Corso Mutuato</label>
                <select class="field" name="corsi_mutuati">
                <#list items>
                    <#items as item>
                    <option value="${item.id}">${item.nome}</option>
                    </#items>
                <#else>
                </#list>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_corso_mutuato_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
