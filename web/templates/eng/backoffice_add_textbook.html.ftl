<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>ADDING A NEW RELATIONSHIP WITH A TEXTBOOK</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>click on the button <b>ADD</b> to add the relationship with an existing textbook</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ADDING FORM</b></p>   
        <ul>
        <li>the field <b>COURSE</b> contains the current course's name, it cannot be edited</li>
        <li>the field <b>TEXTBOOK</b> allow the selection of a degree course to relate with current course, the select shows only the textbook that have not a relationship with the current course yet</li>
        </ul>
        <hr>
        <p><b>ADDING A NEW TEXTBOOK</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>click on the button <b>NEW</b> to adding a new textbook (the new textbook will be related automatically with the current course)</li>
        </ul>
        
    </div>

</div>

<div class="filter">

    <h1 class="title">ADD RELATION WITH TEXTBOOK</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_textbook" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Course</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${strip_slashes(corso.nome)}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="libro_testo_titolo">Textbook</label>
                <select class="field" name="libro_testo_titolo">
                  <#list items>
                      <#items as item>
                      <option value="${item.id}">${strip_slashes(datalayer.getLibroTesto(item.id).getAutore())}&nbsp;-&nbsp;${strip_slashes(item.titolo)}</option>
                      </#items>
                  <#else>
                  </#list>
                </select>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_libro_testo_action" value="ADD"/>
        </div>

      </form>

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_textbook" method="POST">

        <h1 class="title">ADD NEW TEXTBOOK</h1>

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_libro_testo" value="NEW"/>
        </div>

      </form>

    </div>

</div>
