<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>ADDING A NEW RELATIONSHIP WITH A MATERIAL</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>click on the button <b>ADD</b> to add the relationship with an existing material</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ADDING FORM</b></p>   
        <ul>
        <li>the field <b>COURSE</b> contains the current course's name, it cannot be edited</li>
        <li>the field <b>MATERIAL</b> allow the selection of a degree course to relate with current course, the select shows only the material that have not a relationship with the current course yet</li>
        </ul>
        <hr>
        <p><b>ADDING A NEW MATERIAL</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>click on the button <b>NEW</b> to adding a new material (the new material will be related automatically with the current course)</li>
        </ul>
        
    </div>

</div>

<div class="filter">

    <h1 class="title">ADD RELATION WITH MATERIAL</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_material" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Course</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${strip_slashes(corso.nome)}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="materiale_nome">Material</label>
                <select class="field" name="materiale_nome" id="materiale_select">
                  <#list items>
                      <#items as item>
                      <option value="${item.id}">${strip_slashes(item.nome)} - ${datalayer.getUtente(item.utenteId).getNome()}&nbsp;${datalayer.getUtente(item.utenteId).getCognome()}</option>
                      </#items>
                  <#else>
                  </#list>
                </select>

                <label class="label" for="materiale_descrizione">Description</label>
                <textarea class="field" type="text" id="materiale_descrizione" name="materiale_descrizione" readonly="readonly"></textarea>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_materiale_action" value="ADD"/>
        </div>
      
      </form>

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_material" method="POST">

        <h1 class="title">ADD NEW MATERIAL</h1>

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_materiale" value="NEW"/>
        </div>

      </form>

    </div>

</div>
