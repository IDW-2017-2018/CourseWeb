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
    
    <link rel="stylesheet" type="text/css" href="style/${page}.css"/> <!-- da montare dinamicamente -->

</head>

<body>
    
    <!-- ########## TITLE BAR ########## -->

    <div class="title_bar">
        
        <a href="${page}?lang=${lang}">
            <img class="logo_img" src="images/logo_imgs/logoDEF.svg" alt="Logo"/>
        </a>

    </div>

    <#include navbar_tpl>

    <#include content_tpl>

    <!-- ########## LANG BAR ########## -->

    <ul class="lang_bar">

            <li><a href="${page}?lang=ita">ITALIAN</a></li>
            <li><a href="${page}?lang=eng">ENGLISH</a></li>

    </ul>

    <!-- ########## FOOTER ########## -->

    <div class="footer">
        
        <img src="images/logo_imgs/logominDEF.svg" alt="Logo"/>     
        
        <ul class="footer_link_container">

            <li><a class="footer_link_item" href="contacts?lang=${lang}">CONTACTS</a></li>
            <li><a class="footer_link_item" href="about?lang=${lang}">ABOUT</a></li>
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