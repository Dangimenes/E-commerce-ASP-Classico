 <!-- 

 //Browser Support Code
function reserva_livro(id_sessao,id_livro){
	var ajaxRequest; // The variable that makes Ajax possible!
	
	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e){
	// Internet Explorer Browsers
	try{
		ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try{
			ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (e){
			// Something went wrong
			alert("Your browser broke!");
			return false;
			}
		}
	}
	// Create a function that will receive data sent from the server
	ajaxRequest.onreadystatechange = function(){
		if(ajaxRequest.readyState == 4){
			var ajaxDisplay = document.getElementById('carrinho');
			ajaxDisplay.innerHTML = ajaxRequest.responseText;
		}
	}
	var idsessao = id_sessao;
	var idlivro = id_livro;
	
	var queryString = "?id_sessao=" + idsessao + "&id_livro=" + idlivro + "&acao=incluir";
	ajaxRequest.open("GET", "reserva.asp" + queryString, true);
	ajaxRequest.send(null); 

}
	
	//-->


	 <!-- 
//Browser Support Code
function excluir_livro(id_sessao,id_livro){
	var ajaxRequest; // The variable that makes Ajax possible!
	
	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e){
	// Internet Explorer Browsers
	try{
		ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try{
			ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (e){
			// Something went wrong
			alert("Your browser broke!");
			return false;
			}
		}
	}
	// Create a function that will receive data sent from the server
	ajaxRequest.onreadystatechange = function(){
		if(ajaxRequest.readyState == 4){
			var ajaxDisplay = document.getElementById('carrinho');
			ajaxDisplay.innerHTML = ajaxRequest.responseText;
		}
	}
	var idsessao = id_sessao;
	var idlivro = id_livro;
	
	var queryString = "?id_sessao=" + idsessao + "&id_livro=" + idlivro + "&acao=excluir";
	ajaxRequest.open("GET", "reserva.asp" + queryString, true);
	ajaxRequest.send(null); 

}
	
	//-->