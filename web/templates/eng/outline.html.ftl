

<?xml version="1.0" encoding="ISO-8859-1"?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <title>CourseWeb</title>
    
    <meta name="description" content="Online Index of University Courses"/>
    <meta name="keywords" content="HTML, CSS, XML, JavaScript, Java"/>
    <meta name="author" content="Valentino Di Giosaffatte, Riccardo Di Prinzio, Flavio Furia"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <link rel="stylesheet" type="text/css" href="style/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="style/outline.css"/>
    
    <link rel="stylesheet" type="text/css" href="style/login.css"/> <!-- da montare dinamicamente -->

</head>

<body>
    
    <!-- ########## TITLE BAR ########## -->

    <div class="title_bar">
        
        <a href="#!">
            <img class="logo_img" src="images/logo_imgs/Logo.svg" alt="Logo"/>
        </a>

    </div>

    <#include navbar_tpl>

    <#include content_tpl>

    <!-- ########## LANG BAR ########## -->

    <ul class="lang_bar">

            <li><a href="">ITALIAN</a></li>
            <li><a href="">ENGLISH</a></li>

    </ul>

    <!-- ########## FOOTER ########## -->

    <div class="footer">
        
        <img src="images/logo_imgs/LogoMin.svg" alt="Logo"/>     
        
        <ul class="footer_link_container">

            <li><a class="footer_link_item" href="">CONTACTS</a></li>
            <li><a class="footer_link_item" href="">ABOUT</a></li>
            <li><a class="footer_link_item" href="">DISIM</a></li>
        
        </ul>   
        
        <div class="footer_social_container">

            <a href=""><img class="footer_social_icon" src="images/footer_icons/facebook.svg" alt="facebook"/></a>
            <a href=""><img class="footer_social_icon" src="images/footer_icons/twitter.svg" alt="twitter"/></a>
            <a href=""><img class="footer_social_icon" src="images/footer_icons/google.svg" alt="google"/></a>
            <a href=""><img class="footer_social_icon" src="images/footer_icons/github.svg" alt="github"/></a>

        </div>  

    </div>
    
    <div class="copyright">
        
        <p class="copyright_text">2017 &#47; 2018 &copy; CourseWeb</p>
    
    </div>
    
</body>
</html>