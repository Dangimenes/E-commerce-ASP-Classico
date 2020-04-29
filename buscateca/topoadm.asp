<!--#Include file="conexao.inc"--> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <meta charset="UTF-8">
  <title>Buscateca resultados da pesquisa</title>
  <link href="estilo.css" rel="stylesheet" type="text/css" />
  <!--#Include file="jquerymenu.inc"-->
  <script type="text/javascript" src="scripts/ajax.js"></script>
</head>

<body>
<div id="all">
<!-- DIV TOP -->
 

 <div id="menu">
 
   <ul>
    <li><a href="index.asp">Home</a></li>
    <li><a href="bibliotecas.asp">Bibliotecas</a></li> 
    <li><a href="autores.asp">Autores</a></li>
    <li><a href="categoria.asp">Categorias</a></li>
    <li><a href="login_user.asp">Login</a></li>  
   </ul>

 </div>


   <div id="banner2">
    
     <a href="index.asp"><img class="logobuscateca" alt="Buscateca" src="imagens/Buscateca-logo2.gif" /></a>
     
     <div class="search2">
        
       <form name="busca" method="post"  action="resultado.asp">
 
          <input name="busca" type="text" size="35" class="BuscaInput" value="" />
          <input type="submit" name="Submit" id="Buscar"  class="BotOk2" value=" " />
        
       </form>
	   
     </div>
	</div>

