<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>


<div class="helper">
    
    <div class="helpertext">
        
        <p><b>EDIT COURSE HUB</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <p>(the teacher can perform the same operations than the administrator but only for him's courses)</p>
        <ul>
        <li>click on the button <b>EDIT</b> in section <b>COURSE</b> to editing the infos of the selected course</li>
        <li>click on the button <b>ADD</b> in section <b>DEGREE COURSE</b> to add the relationship with an existing degree course</li>
        <li>click on the button <b>DELETE</b> in section <b>DEGREE COURSE</b> to add the relationship with an existing degree course</li>
        <li>click on the button <b>ADD</b> in section <b>SAME AS COURSE</b> to add the relationship with an existing same as course</li>
        <li>click on the button <b>DELETE</b> in section <b>SAME AS COURSE</b> to add the relationship with an existing same as course</li>
        <li>click on the button <b>ADD</b> in section <b>MODULE</b> to add the relationship with an existing module</li>
        <li>click on the button <b>DELETE</b> in section <b>MODULE</b> to add the relationship with an existing module</li>
        <li>click on the button <b>ADD</b> in section <b>PROPAEDEUTIC COURSE</b> to add the relationship with an existing propaedeutic course</li>
        <li>click on the button <b>DELETE</b> in section <b>PROPAEDEUTIC COURSE</b> to add the relationship with an existing propaedeutic course</li>
        <li>click on the button <b>ADD</b> in section <b>TEACHERS</b> to add the relationship with an existing teachers</li>
        <li>click on the button <b>DELETE</b> in section <b>TEACHERS</b> to add the relationship with an existing teachers</li>
        <li>click on the button <b>ADD</b> in section <b>TEXTBOOKS</b> to add the relationship with an existing textbooks</li>
        <li>click on the button <b>DELETE</b> in section <b>TEXTBOOKS</b> to add the relationship with an existing textbooks</li>
        <li>click on the button <b>ADD</b> in section <b>MATERIALS</b> to add the relationship with an existing materials</li>
        <li>click on the button <b>DELETE</b> in section <b>MATERIALS</b>  to add the relationship with an existing materials</li>
        </ul>
        
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
