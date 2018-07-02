<div class="helper">
    
    <div class="helpertext">
        
        <p><b>COURSE ADMINISTRATION</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <p>(the teacher instead can edit only the infos of his current year's courses)</p>
        <ul>
        <li>click on the button <b>ADD</b> to add a new course</li>
        <li>click on the button <b>EDIT</b> to edit infos of an already existing course</li>
        </ul>
    
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
        
        <p><b>USER ADMINISTRATION</b></p>
        <p>In the current page, the administrator can perform the following operations</p>
        <p>(the teacher instead can edit only the infos of his current year's courses)</p>
        <ul>
        <li>click on the button <b>ADD</b> to add a new user</li>
        <li>click on the button <b>EDIT</b> to edit infos of an already existing user</li>
        </ul>
        
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
