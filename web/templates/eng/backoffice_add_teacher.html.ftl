<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>ADDING A NEW RELATIONSHIP WITH A TEACHER</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>click on the button <b>ADD</b> to add the relationship with an existing teacher</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ADDING FORM</b></p>   
        <ul>
        <li>the field <b>COURSE</b> contains the current course's name, it cannot be edited</li>
        <li>the field <b>TEACHER</b> allow the selection of a degree course to relate with current course, the select shows only the teachers that have not a relationship with the current course yet</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">ADD RELATION WITH TEACHER</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_teacher" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Course</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome"" placeholder="${strip_slashes(corso.nome)}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="utente_nome">Teacher</label>
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
            <input class="filterbutton" type="submit" name="aggiungi_docente_action" value="ADD"/>
        </div>

      </form>

    </div>

</div>
