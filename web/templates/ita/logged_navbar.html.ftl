<!-- ########## LOGIN NAV BAR ########## -->

<ul class="navbar">

    <li class="menu_item"><a href="search_courses?lang=${lang}">CORSI</a></li>

	<li class="profile_item"><p>${session.getAttribute('utente').nome!"ospite"}</p></li>
    <img class="profile_icon" src="images/footer_icons/white_svg/user-circle.svg" alt="user-circle"/>

</ul>