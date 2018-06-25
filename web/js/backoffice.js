//<![CDATA[

//var from outline querySuccess, BackPressedAlert

window.onload = onLoadDocument();

function onLoadDocument(){
	createToast();
	prepareMaterialeDescr();
}

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


function prepareMaterialeDescr(){
	var materiali_select = document.getElementById("materiale_select");

	materiali_select.onchange = function(){
	var id = materiali_select.value;

	//
	//DEBUG
	//
	alert(id);
	return;

	retrieveDescrMateriale(id);
};

}


function retrieveDescrMateriale(id){

    var action = 'get_materiale_descrizione';

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
           
			//stampa in log           
            console.log(this.responseText);
            //document.getElementById("resultParagraph").innerHTML
        }
    };
    xmlhttp.open("GET","backofficeeditcourse?action="+ action + "&id=" + id,true);
    xmlhttp.send();
}

//]]>
