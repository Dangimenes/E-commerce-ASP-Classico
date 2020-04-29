<!--#Include file="conexao.inc"-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Buscateca Início</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->
</head>
<body>

<div id="all">

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
		
<div id="banner"> </div>

  <div id="content">
     
      <div class="search">
         <form name="busca" method="post" action="resultado.asp">
           <input name="busca" type="text" size="60" class="BuscaInput" />
           <input type="submit" name="Submit" id="Buscar"  class="BotOk" value="Pesquisa Buscateca" />
         </form>
      </div>         
                
  </div>		
	
 <!--#Include file="footer.asp"-->  

</body>
</html>
