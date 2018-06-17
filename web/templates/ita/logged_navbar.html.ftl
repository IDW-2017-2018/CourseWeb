<!-- ########## LOGIN NAV BAR ########## -->

<ul class="navbar">

    <li class="menu_item"><a href="searchcourses?lang=${lang}">CORSI</a></li>
	
	<#if (session.getAttribute('utente').tipoUtente != "anonimo")>
		<li class="menu_item"><a href="backofficehub?lang=${lang}">BACKOFFICE</a></li>
	</#if>

	<#if (session.getAttribute('utente').tipoUtente != "anonimo") && (page == "backofficeeditcourse") && (corso?? || id??) >
		
		<#if corso??>
			<li class="menu_item"><a href="backofficecourse?lang=${lang}&action=edit_course&id=${corso.id}">HUB DEL CORSO</a></li>
			<li class="menu_item"><a href="course?lang=${lang}&id=${corso.id}" target="_blank">RIEPILOGO CORSO</a></li>
		<#else>
			<li class="menu_item"><a href="backofficecourse?lang=${lang}&action=edit_course&id=${id}">HUB DEL CORSO</a></li>
			<li class="menu_item"><a href="course?lang=${lang}&id=${id}" target="_blank">RIEPILOGO CORSO</a></li>
		</#if>

	</#if>

	<li class="menu_item"><a href="help?lang=${lang}">AIUTO</a></li>
	
	<#if (session.getAttribute('utente').tipoUtente == "amministratore")>
		<li class="menu_item"><a href="backofficehub?lang=${lang}&hub_log=true">LOG</a></li>
	</#if>

        <#if (session.getAttribute('utente').nome != "")>
            <li class="profile_item"><p>${strip_slashes(session.getAttribute('utente').nome)}</p></li>
        <#else>
            <li class="profile_item"><p>ospite</p></li>
        </#if>
            
    <img class="profile_icon" src="images/footer_icons/white_svg/user-circle.svg" alt="user-circle"/>
	
	<li class="logout_item"><a href="login?lang=${lang}&action=logout">LOGOUT</a></li>

</ul>