<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>TITOLO</b></p>

        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        <hr>
        <p><b>TITOLO</b><br>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        
    </div>

</div>

<div class="filter">

    <h1 class="title">AGGIUNTA RELAZIONE CON MATERIALE</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_material" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${strip_slashes(corso.nome)}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="materiale_nome">Materiale</label>
                <select class="field" name="materiale_nome">
                  <#list items>
                      <#items as item>
                      <option value="${item.id}">${strip_slashes(item.nome)}</option>
                      </#items>
                  <#else>
                  </#list>
                </select>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_materiale_action" value="AGGIUNGI"/>
        </div>
      
      </form>

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_material" method="POST">

        <h1 class="title">AGGIUNGI NUOVO MATERIALE</h1>

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_materiale" value="NUOVO"/>
        </div>

      </form>

    </div>

</div>
