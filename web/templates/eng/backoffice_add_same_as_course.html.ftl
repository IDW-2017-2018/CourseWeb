
<div class="filter">
    
    <h1 class="title">ADD RELATION WITH SAME AS COURSE</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=edit_same_as_course" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Course</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${corso.nome}" disabled="disabled"/>

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="corsi_mutuati">Same As Courses</label>
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
            <input class="filterbutton" type="submit" name="aggiungi_corso_mutuato_action" value="ADD"/>
        </div>

      </form>

    </div>

</div>
