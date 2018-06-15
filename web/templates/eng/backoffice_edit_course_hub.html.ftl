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
