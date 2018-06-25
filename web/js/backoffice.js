//<![CDATA[

//var from outline querySuccess, BackPressedAlert

window.onload = createToast();

function createToast() {
	if(querySuccess == "true"){
		//toast success

	} else if(querySuccess == "false"){
		//toast not success

	} else {
        //void
		//no actions
	}
}



function retrieveDescrMateriale(){

    var str = 'get_phones';

    if (window.XMLHttpRequest) {
    // code for modern browsers
    // IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
    // code for old IE browsers
    // IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
           
            console.log(response);
            //document.getElementById("resultParagraph").innerHTML
        }
    };
    xmlhttp.open("GET","script/script.php?task="+str,true);
    xmlhttp.send();
}

//]]>
