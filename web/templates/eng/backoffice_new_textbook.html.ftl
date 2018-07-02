<div class="helper">
    
    <div class="helpertext">
        
        <p><b>ADDING A NEW TEXTBOOK</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <ul>
        <li>click on the button <b>ADD</b> to add a new textbook and create a relation with the current course</li>
        </ul>
        <hr>
        <p><b>INSERTING DATA IN ADDING FORM</b></p>   
        <ul>
        <li>the fields <b>AUTHOR</b>, <b>TITLE</b>, <b>VOLUME</b>, <b>YEAR</b>, <b>EDITOR</b> are required</li>
        </ul>
        
    </div>

</div>

<div class="filter">

    <h1 class="title">ADD NEW COURSE TEXTBOOK</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_textbook" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="libro_testo_autore">Author</label>
                <input class="field" type="text" id="libro_testo_autore" name="libro_testo_autore" required="required"/>

                <label class="label" for="libro_testo_titolo">Title</label>
                <input class="field" type="text" id="libro_testo_titolo" name="libro_testo_titolo" required="required"/>

                <label class="label" for="libro_testo_volume">Volume</label>
                <input class="field" type="text" id="libro_testo_volume" name="libro_testo_volume" required="required"/>

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="libro_testo_anno">Year</label>
                <input class="field" type="text" id="libro_testo_anno" name="libro_testo_anno" required="required"/>

                <label class="label" for="libro_testo_editore">Publisher</label>
                <input class="field" type="text" id="libro_testo_editore" name="libro_testo_editore" required="required"/>

                <label class="label" for="libro_testo_link">Link</label>
                <input class="field" type="text" id="libro_testo_link" name="libro_testo_link"/>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_libro_testo_action" value="ADD"/>
        </div>

      </form>

    </div>

</div>
