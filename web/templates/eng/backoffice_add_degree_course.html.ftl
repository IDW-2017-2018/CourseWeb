<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>ADDING A NEW RELATIONSHIP WITH A DEGREE COURSE</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>click on the button <b>ADD</b> to add the relationship with an existing degree course</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ADDING FORM</b></p>   
        <ul>
        <li>the field <b>COURSE</b> contains the current course's name, it cannot be edited</li>
        <li>the field <b>DEGREE COURSE</b> allow the selection of a degree course to relate with current course</li>
        <li>the fields <b>CFU</b> and <b>CFU TYPE</b> can be edited as parameters of current relationship</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">ADD RELATION WITH DEGREE COURSE</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_degree_course" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Course</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" disabled="disabled" placeholder="${strip_slashes(corso.nome)}"/>

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="corso_laurea_nome">Degree Course</label>
                <select class="field" name="corso_laurea_nome">
                <#list items>
                	<#items as item>
                    <option value="${strip_slashes(item.nome)}">${strip_slashes(item.nome)}</option>
                    </#items>
                <#else>
				</#list>
                </select>

                <label class="label" for="numero_cfu">CFU</label>
                <input class="field" type="text" id="numero_cfu" name="numero_cfu"/>

                <label class="label" for="tipo_cfu">CFU Type</label>
                <select class="field" name="tipo_cfu">
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    <option value="F">F</option>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_corso_laurea_action" value="ADD"/>
        </div>

      </form>

    </div>

</div>
