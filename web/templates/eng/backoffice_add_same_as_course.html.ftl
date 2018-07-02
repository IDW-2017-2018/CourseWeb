<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>ADDING A NEW RELATIONSHIP WITH A SAME AS COURSE</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>click on the button <b>ADD</b> to add the relationship with an existing same as course</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ADDING FORM</b></p>   
        <ul>
        <li>the field <b>COURSE</b> contains the current course's name, it cannot be edited/li>
        <li>the field <b>SAME AS COURSE</b> allow the selection of a degree course to relate with current course, the select shows only the courses that have not a relationship with the current course yet. Moreover the select shows only the courses that belong at the same degree course of the current course.</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">ADD RELATION WITH SAME AS COURSE</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_same_as_course" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Course</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${strip_slashes(corso.nome)}" disabled="disabled"/>

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="corsi_mutuati">Same As Courses</label>
                <select class="field" name="corsi_mutuati">
                <#list items>
                    <#items as item>
                    <option value="${item.id}">${strip_slashes(item.nome)}</option>
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
