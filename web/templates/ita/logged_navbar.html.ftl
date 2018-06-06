<!-- ########## LOGIN NAV BAR ########## -->

<ul class="navbar">

    <li class="menu_item"><a href="searchcourses?lang=${lang}">CORSI</a></li>

	<li class="menu_item"><a href="backofficehub?lang=${lang}">BACKOFFICE</a></li>

        <#if (session.getAttribute('utente').nome != "")>
            <li class="profile_item"><p>${session.getAttribute('utente').nome}</p></li>
        <#else>
            <li class="profile_item"><p>ospite</p></li>
        </#if>
            
    <img class="profile_icon" src="images/footer_icons/white_svg/user-circle.svg" alt="user-circle"/>
	
	<li class="profile_item"><a href="login?lang=${lang}&action=logout">LOGOUT</a></li>

</ul>