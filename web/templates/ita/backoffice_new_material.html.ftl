<div class="helper">
    
    <div class="helpertext">
        
        <p><b>TITOLO</b></p>

        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        <hr>
        <p><b>TITOLO</b><br>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        
    </div>

</div>

<div class="filter">

    <h1 class="title">AGGIUNTA NUOVO MATERIALE ASSOCIATO AL CORSO</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_material" method="POST" enctype="multipart/form-data">

            <div class="fieldcontainerleft">

                <label class="label" for="materiale_nome">Nome</label>
                <input class="field" type="text" id="materiale_nome" name="materiale_nome"/>
                
                <label class="label" for="materiale_file">File</label>
                <input class="field" type="file" id="materiale_file" name="materiale_file"/>

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="materiale_descrizione">Descrizione</label>
                <input class="field" type="text" id="materiale_descrizione" name="materiale_descrizione"/>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_materiale_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
