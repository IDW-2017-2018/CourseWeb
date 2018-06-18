<div class="helper">
    
    <div class="helpertext">
        
        <p><b>TITOLO</b></p>

        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        <hr>
        <p><b>TITOLO</b><br>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        
    </div>

</div>

<div class="filter">

    <h1 class="title">ADD NEW COURSE TEXTBOOK</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_textbook" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="libro_testo_autore">Author</label>
                <input class="field" type="text" id="libro_testo_autore" name="libro_testo_autore"/>

                <label class="label" for="libro_testo_titolo">Title</label>
                <input class="field" type="text" id="libro_testo_titolo" name="libro_testo_titolo"/>

                <label class="label" for="libro_testo_volume">Volume</label>
                <input class="field" type="text" id="libro_testo_volume" name="libro_testo_volume"/>

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="libro_testo_anno">Year</label>
                <input class="field" type="text" id="libro_testo_anno" name="libro_testo_anno"/>

                <label class="label" for="libro_testo_editore">Publisher</label>
                <input class="field" type="text" id="libro_testo_editore" name="libro_testo_editore"/>

                <label class="label" for="libro_testo_link">Link</label>
                <input class="field" type="text" id="libro_testo_link" name="libro_testo_link"/>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_libro_testo_action" value="ADD"/>
        </div>

      </form>

    </div>

</div>
