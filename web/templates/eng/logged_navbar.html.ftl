<!-- ########## LOGIN NAV BAR ########## -->

<ul class="navbar">

    <li class="menu_item"><a href="searchcourses?lang=${lang}">COURSES</a></li>

    <#if (session.getAttribute('utente').tipoUtente != "anonimo")>
	<li class="menu_item"><a href="backofficehub?lang=${lang}">BACKOFFICE</a></li>
	</#if>

    <#if (session.getAttribute('utente').tipoUtente != "anonimo") && corso?? && page==backoffice>
    <li class="menu_item"><a href="backofficehub?lang=${lang}">COURSE HUB</a></li>
    </#if>
    
        <#if (session.getAttribute('utente').nome != "")>
            <li class="profile_item"><p>${session.getAttribute('utente').nome}</p></li>
        <#else>
            <li class="profile_item"><p>guest</p></li>
        </#if>
  
    <img class="profile_icon" src="images/footer_icons/white_svg/user-circle.svg" alt="user-circle"/>

    <li class="profile_item"><a href="login?lang=${lang}&action=logout">LOGOUT</a></li>

</ul>