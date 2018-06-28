<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>AGGIUNTA NUOVA RELAZIONE CON CORSO PROPEDEUTICO</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
        <li>clicca sul bottone <b>AGGIUNGI</b> per aggiungere una nuova relazione con un corso propedeutico esistente</li>
        </ul>
        <hr>
        <p><b>INSERIMENTO DATI NELLA FORM DI AGGIUNTA</b></p>   
        <ul>
        <li>il campo <b>CORSO</b> contiene il nome del corso corrente, non pu&ograve; essere modificato</li>
        <li>il campo <b>CORSO PROPEDEUTICO</b> permette di scegliere il corso propedeutico da relazionare con il corso corrente, nella select appariranno solo i corsi che non possiedono gi&agrave; una relazione con il corso corrente e che appartengono allo stesso corso di laurea del corso corrente</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">AGGIUNTA RELAZIONE CON CORSO PROPEDEUTICO</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_propaedeutic_course" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${strip_slashes(corso.nome)}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="corso_nome">Corso Propedeutico</label>
                <select class="field" name="corso_nome">
                <#list items>
                    <#items as item>
                    <option value="${item.id}">${strip_slashes(item.nome)}</option>
                    </#items>
                <#else>
				</#list>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_corso_propedeutico_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
