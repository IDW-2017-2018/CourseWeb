<h1 class="coursename">${corso.nome}<br>${corso.anno}</h1>

<div class="helper">
    
    <div class="helpertext">
        
        <p><b>AGGIUNTA NUOVA RELAZIONE CON CORSO DI LAUREA</b></p>
        <p>Nella pagina corrente l'utente amministratore pu&ograve; eseguire le seguenti operazioni</p>
        <ul>
        <li>clicca sul bottone <b>AGGIUNGI</b> per aggiungere una nuova relazione con un corso di laurea esistente</li>
        </ul>
        <hr>
        <p><b>INSERIMENTO DATI NELLA FORM DI AGGIUNTA</b></p>   
        <ul>
        <li>il campo <b>CORSO</b> contiene il nome del corso corrente, non pu&ograve; essere modificato</li>
        <li>il campo <b>CORSO DI LAUREA</b> permette di scegliere il corso di laurea da relazionare con il corso corrente, nella select appariranno solo i corsi di laurea esistenti che non possiedono gi&agrave; una relazione con il corso corrente</li>
        <li>i campi <b>CFU</b>, <b>TIPO CFU</b> possono essere modificati dall'utente come parametri della relazione corrente</li>
        </ul>
        
    </div>

</div>

<div class="filter">
    
    <h1 class="title">AGGIUNTA RELAZIONE CON CORSO LAUREA</h1>
    
    <div class="formcontainer">
        
      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_degree_course" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" disabled="disabled" placeholder="${strip_slashes(corso.nome)}"/>

            </div>


            <div class="fieldcontainerright">
                
                <label class="label" for="corso_laurea_nome">Corso di Laurea</label>
                <select class="field" name="corso_laurea_nome">
                <#list items>
                	<#items as item>
                    <option value="${strip_slashes(item.nome)}">${strip_slashes(item.nome)}</option>
                    </#items>
                <#else>
				</#list>
                </select>

                <label class="label" for="numero_cfu">CFU</label>
                <input class="field" type="text" id="numero_cfu" name="numero_cfu"/>

                <label class="label" for="tipo_cfu">Tipo CFU</label>
                <select class="field" name="tipo_cfu">
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    <option value="F">F</option>
                </select>
                
            </div>


        <div class="buttoncontainer">               
            <input class="filterbutton" type="submit" name="aggiungi_corso_laurea_action" value="AGGIUNGI"/>
        </div>

      </form>

    </div>

</div>
