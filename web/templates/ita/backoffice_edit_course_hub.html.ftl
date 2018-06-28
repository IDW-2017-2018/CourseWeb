<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>


<div class="helper">
    
    <div class="helpertext">
        
        <p><b>HUB DI MODIFICA DEL CORSO</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <P>(l'utente docente pu&ograve; eseguire le medesime operazioni dell'amministratore ma solo per i propri corsi)</P>
        <ul>
        <li>clicca sul bottone <b>MODIFICA</b> nella sezione <b>CORSO</b> per modificare le informazioni relative al corso selezionato</li>
        <li>clicca sul bottone <b>AGGIUNGI</b> nella sezione <b>CORSO DI LAUREA</b> per aggiungere una relazione con un corso di laurea esistente per il corso corrente</li>
        <li>clicca sul bottone <b>ELIMINA</b> nella sezione <b>CORSO DI LAUREA</b> per eliminare una relazione con un corso di laurea gi&agrave; presente per il corso corrente</li>
        <li>clicca sul bottone <b>AGGIUNGI</b> nella sezione <b>CORSI MUTUATI</b> per aggiungere una relazione con un corso mutuato esistente per il corso corrente</li>
        <li>clicca sul bottone <b>ELIMINA</b> nella sezione <b>CORSI MUTUATI</b> per eliminare una relazione con un corso mutuato gi&agrave; presente per il corso corrente</li>
        <li>clicca sul bottone <b>AGGIUNGI</b> nella sezione <b>MODULO</b> per aggiungere una relazione con un modulo (corso) esistente per il corso corrente</li>
        <li>clicca sul bottone <b>ELIMINA</b> nella sezione <b>MODULO</b> per eliminare una relazione con un modulo (corso) gi&agrave; presente per il corso corrente</li>
        <li>clicca sul bottone <b>AGGIUNGI</b> nella sezione <b>CORSI PROPEDEUTICI</b> per aggiungere una relazione con un corso propedeutico esistente per il corso corrente</li>
        <li>clicca sul bottone <b>ELIMINA</b> nella sezione <b>CORSI PROPEDEUTICI</b> per eliminare una relazione con un corso propedeutico gi&agrave; presente per il corso corrente</li>
        <li>clicca sul bottone <b>AGGIUNGI</b> nella sezione <b>DOCENTI</b> per aggiungere una relazione con un docente esistente per il corso corrente</li>
        <li>clicca sul bottone <b>ELIMINA</b> nella sezione <b>DOCENTI</b> per eliminare una relazione con un docente gi&agrave; presente per il corso corrente</li>
        <li>clicca sul bottone <b>AGGIUNGI</b> nella sezione <b>LIBRI DI TESTO</b> per aggiungere una relazione con un libro di testo esistente per il corso corrente oppure per creare un nuovo libro di testo da associare al corso corrente</li>
        <li>clicca sul bottone <b>ELIMINA</b> nella sezione <b>LIBRI DI TESTO</b> per eliminare una relazione con un libro di testo gi&agrave; presente per il corso corrente</li>
        <li>clicca sul bottone <b>AGGIUNGI</b> nella sezione <b>MATEIRALI</b> per aggiungere una relazione con un materiale esistente per il corso corrente oppure per creare un nuovo materiale da associare al corso corrente</li>
        <li>clicca sul bottone <b>ELIMINA</b> nella sezione <b>MATEIRALI</b> per eliminare una relazione con un materiale gi&agrave; presente per il corso corrente</li>
        </ul>
        
    </div>

</div>


<div class="filter">

    <h1 class="title"> CORSO </h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=edit_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="modifica_corso" value="MODIFICA"/>
        </div>

    </form>

    </div>

</div>


<div class="filter">

    <h1 class="title"> CORSI LAUREA </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_degree_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_corso_laurea" value="AGGIUNGI"/>
        </div>
    
    </form>
    
    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_degree_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_corso_laurea" value="ELIMINA"/>
        </div>

    </form>

    </div>

</div>


<div class="filter-divider">

<div class="filter-left">

    <h1 class="title"> CORSI MUTUATI </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_same_as_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_corso_mutuato" value="AGGIUNGI"/>
        </div>
    
    </form>
    
    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_same_as_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_corso_mutuato" value="ELIMINA"/>
        </div>

    </form>

    </div>

</div>


<div class="filter-right">

    <h1 class="title"> MODULI </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_module" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_modulo" value="AGGIUNGI"/>
        </div>
    
    </form>
    
    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_module" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_modulo" value="ELIMINA"/>
        </div>

    </form>

    </div>

</div>

</div>


<div class="filter-divider">

<div class="filter-left">

    <h1 class="title"> CORSI PROPEDEUTICI </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_propaedeutic_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_corso_propedeutico" value="AGGIUNGI"/>
        </div>
    
    </form>

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_propaedeutic_course" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_corso_propedeutico" value="ELIMINA"/>
        </div>

    </form>

    </div>

</div>


<div class="filter-right">

    <h1 class="title"> DOCENTI </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_teacher" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_docente" value="AGGIUNGI"/>
        </div>
    
    </form>
    
    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_teacher" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_docente" value="ELIMINA"/>
        </div>

    </form>

    </div>

</div>

</div>


<div class="filter-divider-last">

<div class="filter-left">

    <h1 class="title"> LIBRI DI TESTO </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_textbook" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_libro_testo" value="AGGIUNGI"/>
        </div>
    
    </form>

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_textbook" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_libro_testo" value="ELIMINA"/>
        </div>

    </form>

    </div>

</div>


<div class="filter-right">

    <h1 class="title"> MATERIALI </h1>

    <div class="formcontainer">

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=add_material" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_materiale" value="AGGIUNGI"/>
        </div>

    </form>

    <form action="backofficeeditcourse?lang=${lang}&id=${id}&action=delete_material" method="POST">

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="elimina_materiale" value="ELIMINA"/>
        </div>

    </form>

    </div>

</div>

</div>

<!-- snackbar -->
<div id="snackbar"></div>
