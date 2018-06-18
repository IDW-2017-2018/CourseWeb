<?xml version="1.0" encoding="ISO-8859-1"?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    
    <link rel="icon" href="images/logo_imgs/prove/favicon.png" type="image/png"/> <!-- da sistemare usa .ico -->
    <title>CourseWeb</title>
    
    <meta name="description" content="Online Index of University Courses"/>
    <meta name="keywords" content="HTML, CSS, XML, JavaScript, Java"/>
    <meta name="author" content="${defaults.authors}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <link rel="stylesheet" type="text/css" href="style/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="style/outline.css"/>
    
    <link rel="stylesheet" type="text/css" href="style/${style}.css"/> <!-- da montare dinamicamente -->

</head>

<body>
    
    <!-- ########## TITLE BAR ########## -->

    <div class="title_bar">
        <a>
            <img class="logo_img" src="images/logo_imgs/logoDEF.svg" alt="Logo"/>
        </a>
    </div>

    <#include navbar_tpl>

    <#include content_tpl>

    <!-- ########## LANG BAR ########## -->

    <ul class="lang_bar">

    	<#if id?? && action?? && item?? && name?? && hub_log?? >
            <li><a href="backofficehub?lang=ita&id=${id}&action=${action}&item=${item}&name=${name}&hub_log=true">ITALIANO</a></li>
            <li><a href="backofficehub?lang=eng&id=${id}&action=${action}&item=${item}&name=${name}&hub_log=true">INGLESE</a></li>
        
        <#elseif id?? && action?? && item?? && name??>
            <li><a href="${page}?lang=ita&id=${id}&action=${action}&item=${item}&name=${name}">ITALIANO</a></li>
            <li><a href="${page}?lang=eng&id=${id}&action=${action}&item=${item}&name=${name}">INGLESE</a></li>

		<#elseif id?? && action?? && item?? && hub_log??>
            <li><a href="backofficehub?lang=eng&id=${id}&action=${action}&item=${item}&hub_log=true">ITALIANO</a></li>
            <li><a href="backofficehub?lang=ita&id=${id}&action=${action}&item=${item}&hub_log=true">INGLESE</a></li>

        <#elseif id?? && action?? && item??>
            <li><a href="${page}?lang=ita&id=${id}&action=${action}&item=${item}">ITALIANO</a></li>
            <li><a href="${page}?lang=eng&id=${id}&action=${action}&item=${item}">INGLESE</a></li>

        <#elseif id?? && action?? && hub_log??>
        <li><a href="backofficehub?lang=ita&id=${id}&action=${action}&hub_log=true">ITALIANO</a></li>
        <li><a href="backofficehub?lang=eng&id=${id}&action=${action}&hub_log=true">INGLESE</a></li>
            	
        <#elseif id?? && action??>
            <li><a href="${page}?lang=ita&id=${id}&action=${action}">ITALIANO</a></li>
            <li><a href="${page}?lang=eng&id=${id}&action=${action}">INGLESE</a></li>

        <#elseif id??>
            <li><a href="${page}?lang=ita&id=${id}">ITALIANO</a></li>
            <li><a href="${page}?lang=eng&id=${id}">INGLESE</a></li>

        <#elseif action??>
            <li><a href="${page}?lang=ita&action=${action}">ITALIANO</a></li>
            <li><a href="${page}?lang=eng&action=${action}">INGLESE</a></li>
        
        <#elseif item??>
            <li><a href="${page}?lang=ita&item=${item}">ITALIANO</a></li>
            <li><a href="${page}?lang=eng&item=${item}">INGLESE</a></li>

        <#elseif name??>
            <li><a href="${page}?lang=ita&name=${name}">ITALIANO</a></li>
            <li><a href="${page}?lang=eng&name=${name}">INGLESE</a></li>

       	<#elseif hub_log??>
        <li><a href="backofficehub?lang=ita&hub_log=true">ITALIANO</a></li>
        <li><a href="backofficehub?lang=eng&hub_log=true">INGLESE</a></li>

        <#else>
            <li><a href="${page}?lang=ita">ITALIANO</a></li>
            <li><a href="${page}?lang=eng">INGLESE</a></li>

        </#if>
        
    </ul>

    <!-- ########## FOOTER ########## -->

    <div class="footer">
        
        <img src="images/logo_imgs/logominDEF.svg" alt="Logo"/>     
        
        <ul class="footer_link_container">

            <li><a class="footer_link_item" href="contacts?lang=${lang}">CONTATTI</a></li>
            <li><a class="footer_link_item" href="about?lang=${lang}">INFORMAZIONI</a></li>
            <li><a class="footer_link_item" href="http://www.disim.univaq.it/main/index.php" target="_blank">DISIM</a></li>
        
        </ul>   
        
        <div class="footer_social_container">

            <a href="https://it-it.facebook.com/" target="_blank"><img class="footer_social_icon" src="images/footer_icons/white_svg/facebook.svg" alt="facebook"/></a>
            <a href="https://twitter.com/" target="_blank"><img class="footer_social_icon" src="images/footer_icons/white_svg/twitter.svg" alt="twitter"/></a>
            <a href="https://www.google.it/" target="_blank"><img class="footer_social_icon" src="images/footer_icons/white_svg/google.svg" alt="google"/></a>
            <a href="https://github.com/IDW-2017-2018/CourseWeb" target="_blank"><img class="footer_social_icon" src="images/footer_icons/white_svg/github.svg" alt="github"/></a>

        </div>  

    </div>
    
    <div class="copyright">
        
        <p class="copyright_text">2017 &#47; 2018 &copy; CourseWeb</p>
    
    </div>
    
</body>
</html>