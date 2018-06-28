<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>AGGIUNTA NUOVA RELAZIONE CON LIBRO DI TESTO</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
        <li>clicca sul bottone <b>AGGIUNGI</b> per aggiungere una nuova relazione con un libro di testo esistente</li>
        </ul>
        <hr>
        <p><b>INSERIMENTO DATI NELLA FORM DI AGGIUNTA</b></p>   
        <ul>
        <li>il campo <b>CORSO</b> contiene il nome del corso corrente, non pu&ograve; essere modificato</li>
        <li>il campo <b>LIBRO DI TESTO</b> permette di scegliere il libro di testo da relazionare con il corso corrente, nella select appariranno solo i libri di testo che non possiedono gi&agrave; una relazione con il corso corrente</li>
        </ul>
        <hr>
        <p><b>AGGIUNTA NUOVO LIBRO DI TESTO</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
        <li>clicca sul bottone <b>NUOVO</b> per aggiungere un nuovo libro di testo (il nuovo libro di testo creato verr&agrave; relazionato automaticamente con il corso corrente)</li>
        </ul>
        
    </div>

</div>

<div class="filter">

    <h1 class="title">AGGIUNTA RELAZIONE CON LIBRO TESTO</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_textbook" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${strip_slashes(corso.nome)}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="libro_testo_titolo">Libro di Testo</label>
                <select class="field" name="libro_testo_titolo">
                  <#list items>
                      <#items as item>
                      <option value="${item.id}">${strip_slashes(datalayer.getLibroTesto(item.id).getAutore())}&nbsp;-&nbsp;${strip_slashes(item.titolo)}</option>
                      </#items>
                  <#else>
                  </#list>
                </select>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_libro_testo_action" value="AGGIUNGI"/>
        </div>
      
      </form>

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_textbook" method="POST">

        <h1 class="title">AGGIUNGI NUOVO LIBRO DI TESTO</h1>

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_libro_testo" value="NUOVO"/>
        </div>

      </form>

    </div>

</div>
