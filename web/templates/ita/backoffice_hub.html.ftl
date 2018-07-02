<div class="helper">
    
    <div class="helpertext">
        
        <p><b>GESTIONE CORSI</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <p>(l'utente docente potr&agrave; invece modificare le informazioni relative ai soli suoi corsi dell'anno accademico corrente)</p>
        <ul>
        <li>clicca sul bottone <b>AGGIUNGI</b> per aggiungere un nuovo corso</li>
        <li>clicca sul bottone <b>MODIFICA</b> per modificare le informazioni relative a un corso gi&agrave; esistente</li>
        </ul>
        
    </div>

</div>


<div class="filter">
    
    <h1 class="title">CORSI</h1>
    
    <div class="formcontainer">
        
      <form action="backofficehub?lang=${lang}" method="POST">
      	<#if (session.getAttribute('utente').tipoUtente == "amministratore")>
	        <div class="buttoncontainer">               
	            <input class="filterbutton" type="submit" name="hub_aggiungi_corso" value="AGGIUNGI"/>
	        </div>
        </#if>

        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="hub_modifica_corso" value="MODIFICA"/>
        </div>

      </form>

    </div>

</div>

<#if (session.getAttribute('utente').tipoUtente == "amministratore")>
<div class="helper">
    
    <div class="helpertext">
        
        <p><b>GESTIONE UTENTI</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
        <li>clicca sul bottone <b>AGGIUNGI</b> per aggiungere un nuovo utente (docente o amministratore)</li>
        <li>clicca sul bottone <b>MODIFICA</b> per modificare le informazioni relative a un utente gi&agrave; esistente</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">UTENTI</h1>
    
    <div class="formcontainer">
        
      <form action="backofficehub?lang=${lang}" method="POST">

        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="hub_aggiungi_utente" value="AGGIUNGI"/>
        </div>

        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="hub_modifica_utente" value="MODIFICA"/>
        </div>

      </form>

    </div>

</div>
<#else>
</#if>

<!-- snackbar -->
<div id="snackbar"></div>

