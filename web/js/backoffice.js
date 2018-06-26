//<![CDATA[

window.onload = onLoadDocument();

function onLoadDocument(){
	createToast();
	prepareMaterialeDescr();
}

function createToast() {

	var query = window.location.search.substring(1);
	var qs = parse_query_string(query);
	
	var success = qs.querysuccess;

	if(success == "true"){
		//toast success
		var x = document.getElementById("snackbar");
		x.innerHTML = "Success";
		showToast();
	} else if(success == "false"){
		//toast not success
		var x = document.getElementById("snackbar");
		x.innerHTML = "Error";
		showToast();
	} else {
        //void
		//no actions
	}
}


function prepareMaterialeDescr(){
	var materiali_select = document.getElementById("materiale_select");

	if(materiali_select == null)
		return;

	if(materiali_select.value == null)
		return;


	var id = materiali_select.value;
	retrieveDescrMateriale(id);

	materiali_select.onchange = function(){
		var id = materiali_select.value;

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
            console.log("res: " + this.responseText);
            document.getElementById("materiale_descrizione").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET","backofficeeditcourse?action="+ action + "&id=" + id,true);
    xmlhttp.send();
}


function showToast() {
    // Get the snackbar DIV
    var x = document.getElementById("snackbar");

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}

/*
*
* QUERY STRING PARSER
*
*/
function parse_query_string(query) {
  var vars = query.split("&");
  var query_string = {};

  for (var i = 0; i < vars.length; i++) {

    var pair = vars[i].split("=");
    var key = decodeURIComponent(pair[0]);
    var value = decodeURIComponent(pair[1]);
    // If first entry with this name
    if (typeof query_string[key] === "undefined") {
      query_string[key] = decodeURIComponent(value);
      // If second entry with this name
    } else if (typeof query_string[key] === "string") {
      var arr = [query_string[key], decodeURIComponent(value)];
      query_string[key] = arr;
      // If third or later entry with this name
    } else {
      query_string[key].push(decodeURIComponent(value));
    }

  }
  return query_string;
}

//]]>
