<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Buscateca Login</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->
</head>

<body>
<!--#Include file="topo.asp"-->    
   <!-- DIV CONTENT -->

<div id="login" > 
  
   <form class="formLogin" name="login" method="post" action="user_session.asp" >
     <b>Login :</b> <input name="login"  type="text" size="15" required /><p />
     <b>Senha:</b> <input name="senha"  type="password" size="15" required /><p />
     <input class="btn-blue" type="submit" name="Btlogin" value="Entrar" />
  
<%
 if (Session("logado") = 2) then
%>

	<h2>Aviso: Usuário ou senha incorretos.</h2>
<%
end if
%>

 <p> Não possui cadastro ? <br><a href="cadastro_user.asp" class="m2"> Clique aqui</br></a></p>
 </form>
 </div>    

<!--#Include file="footer.asp"--> 
 
</body>
</html>
