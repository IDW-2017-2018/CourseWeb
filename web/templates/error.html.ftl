
<?xml version="1.0" encoding="ISO-8859-1"?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <title>CourseWeb</title>
    
    <meta name="description" content="Online Index of University Courses"/>
    <meta name="keywords" content="HTML, CSS, XML, JavaScript, Java"/>
    <meta name="author" content="${defaults.authors}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <link rel="stylesheet" type="text/css" href="normalize.css"/>
    
    <link rel="stylesheet" type="text/css" href="error.css"/>

</head>

    <body style="background-color: #d5d5d5;">
        <div style=" 
        width: 60%; 
        margin: auto;
        margin-top: 50px;
        border: 2px solid black;
        text-align: center;
        ">

            <h1>HTTP STATUS 500</h1>
            <h1>INTERNAL SERVER ERROR</h1>
            <p>The System encountered the following error while handling your request : </p>
            <p>${error!"Unknown Error"}</p>

        
        </div>
    </body>

</html>