<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buscateca ADM Login</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->
</head>
<body>
    
   <form class="formLoginAdm" name="login" method="post" action="admsession.asp" >
   
   <div style="clear:both; padding: 10px 20px;   position: relative;" >
   <img src="imagens/Buscateca-logo2.gif" alt="Buscateca"  />
   </div>
     
   <b>Login:</b> <input name="login"  type="text" size="15"/><p />
   <b>Senha:</b> <input name="senha"  type="password" size="15"/><p />
   <input class="btn-blue" type="submit" name="Btlogin" value="Entrar" />
   <p> Somente administradores podem se logar nesta página </a></p>
   
<%
if (session("logado")=2) then
%>
  
  <h2><font color="red">Login ou Senha Incorretos!</font></h2>
  
<%end if%>
   
   </form> 

 <!--#Include file="footer.asp"-->

</body>
</html>
