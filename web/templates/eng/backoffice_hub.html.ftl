<div class="helper">
    
    <div class="helpertext">
        
        <p><b>TITLE</b></p>

        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        <hr>
        <p><b>TITLE</b><br>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        
    </div>

</div>


<div class="filter">
    
    <h1 class="title">COURSES</h1>
    
    <div class="formcontainer">
        
      <form action="backofficehub?lang=${lang}" method="POST">
        <#if (session.getAttribute('utente').tipoUtente == "amministratore")>
            <div class="buttoncontainer">               
                <input class="filterbutton" type="submit" name="hub_aggiungi_corso" value="ADD"/>
            </div>
        </#if>

        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="hub_modifica_corso" value="EDIT"/>
        </div>

      </form>

    </div>

</div>

<#if (session.getAttribute('utente').tipoUtente == "amministratore")>
<div class="helper">
    
    <div class="helpertext">
        
        <p><b>TITLE</b></p>

        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        <hr>
        <p><b>TITLE</b><br>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">USERS</h1>
    
    <div class="formcontainer">
        
      <form action="backofficehub?lang=${lang}" method="POST">

        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="hub_aggiungi_utente" value="ADD"/>
        </div>

        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="hub_modifica_utente" value="EDIT"/>
        </div>

      </form>

    </div>

</div>
<#else>
</#if>

<!-- snackbar -->
<div id="snackbar"></div>
