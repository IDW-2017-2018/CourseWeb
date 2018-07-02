<div class="helper">
    
    <div class="helpertext">
        
        <p><b>ADDING A NEW MATERIAL</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>click on the button <b>ADD</b> to add a new material and create a relation with the current course</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ADDING FORM</b></p>   
        <ul>
        <li>the fields <b>NAME</b>, <b>DESCRIPTION</b> and <b>FILE</b> are required</li>
        <li>the field <b>FILE</b> allows user to select file for uploading, any format's typology is allowed</li>
        </ul>
        
    </div>

</div>

<div class="filter">

    <h1 class="title">ADD NEW COURSE MATERIAL</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_material" method="POST" enctype="multipart/form-data">

            <div class="fieldcontainerleft">

                <label class="label" for="materiale_nome">Name</label>
                <input class="field" type="text" id="materiale_nome" name="materiale_nome" required="required"/>

                <label class="label" for="materiale_file">File</label>
                <input class="field" type="file" id="materiale_file" name="materiale_file" required="required"/>

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="materiale_descrizione">Description</label>
                <input class="field" type="text" id="materiale_descrizione" name="materiale_descrizione" required="required"/>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_materiale_action" value="ADD"/>
        </div>

      </form>

    </div>

</div>
