<!--#Include file="conexao.inc"--> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
   
      <%
   dim rsU
   
   set rsU = Server.CreateObject("ADODB.Recordset")
   rsU.open " SELECT * FROM cadastro_usuarios", conexao
   
     %>
   
   <ul>
   
   <%
     if (Session("logado") = true) then
	 sqlU = "Select * from cadastro_usuarios where usuarioID = " & session("userid")
     set rsU = conexao.execute(sqlU)
   %>

    <li><a href="index.asp">Home</a></li>
    <li><a href="bibliotecas.asp">Bibliotecas</a></li> 
    <li><a href="autores.asp">Autores</a></li>
    <li><a href="categoria.asp">Categorias</a></li>
    
    <li class="liuser">
         <b> <% = rsU("login")%> </b> 
        <ul>
          <li><a href="atualiza_user.asp">Editar Perfil</a></li>
          <li><a href="HistoryUser.asp"> Historico</a></li>
          <li><a href="reserva.asp?acao=sair&id_sessao=<% = session("session_id") %>">Sair</a></li>
        </ul>
    </li>

     <% else %>

    <li><a href="index.asp">Home</a></li>
    <li><a href="bibliotecas.asp">Bibliotecas</a></li>
    <li><a href="autores.asp">Autores</a></li>
    <li><a href="categoria.asp">Categorias</a></li>
    <li><a href="login_user.asp">Login</a></li>  
    
      <% end if %>
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
    
 <!--#Include file="menu_left.asp"-->

   </div>
   
   
   
    <!-- FIM DIV TOP -->

