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

    <h1 class="title"> COURSES </h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=edit_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="modifica_corso" value="EDIT"/>
        </div>

    </form>

    </div>

</div>


<div class="filter">

    <h1 class="title"> DEGREES </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_degree_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_corso_laurea" value="ADD"/>
        </div>
    
    </form>
    
    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_degree_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_corso_laurea" value="DELETE"/>
        </div>

    </form>

    </div>

</div>


<div class="filter-divider">

<div class="filter-left">

    <h1 class="title"> SAME AS COURSES </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_same_as_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_corso_mutuato" value="ADD"/>
        </div>
    
    </form>
    
    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_same_as_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_corso_mutuato" value="DELETE"/>
        </div>

    </form>

    </div>

</div>


<div class="filter-right">

    <h1 class="title"> MODULES </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_module" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_modulo" value="ADD"/>
        </div>
    
    </form>
    
    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_module" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_modulo" value="DELETE"/>
        </div>

    </form>

    </div>

</div>

</div>


<div class="filter-divider">

<div class="filter-left">

    <h1 class="title"> PROPAEDEUTIC COURSES </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_propaedeutic_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_corso_propedeutico" value="ADD"/>
        </div>
    
    </form>

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_propaedeutic_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_corso_propedeutico" value="DELETE"/>
        </div>

    </form>

    </div>

</div>


<div class="filter-right">

    <h1 class="title"> TEACHERS </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_teacher" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_docente" value="ADD"/>
        </div>
    
    </form>
    
    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_teacher" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_docente" value="DELETE"/>
        </div>

    </form>

    </div>

</div>

</div>


<div class="filter-divider-last">

<div class="filter-left">

    <h1 class="title"> TEXTBOOKS </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_textbook" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_libro_testo" value="ADD"/>
        </div>
    
    </form>

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_textbook" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_libro_testo" value="DELETE"/>
        </div>

    </form>

    </div>

</div>


<div class="filter-right">

    <h1 class="title"> MATERIALS </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_material" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_materiale" value="ADD"/>
        </div>

    </form>

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_material" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_materiale" value="DELETE"/>
        </div>

    </form>

    </div>

</div>

</div>

<!-- snackbar -->
<div id="snackbar"></div>
