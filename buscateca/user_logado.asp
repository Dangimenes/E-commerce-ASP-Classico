<%@LANGUAGE="VBSCRIPT"%>
<%
If NOT Session("logado") = true Then
Response.redirect("login_user.asp")
Response.End
End If
%>	
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Buscateca Cadastro</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->
</head>

<body>
 
  <!--#Include file="topo.asp"-->
    
   <!-- DIV CONTENT -->

   <div id="content2">   
   <h1> ÁREA DO USUARIO EM CONSTRUCAO </h1>
   <h2> ÁREA DO USUARIO EM CONSTRUCAO </h2>
   <h3> ÁREA DO USUARIO EM CONSTRUCAO </h3>
   <h1> ÁREA DO USUARIO EM CONSTRUCAO </h1>
   <h2> ÁREA DO USUARIO EM CONSTRUCAO </h2>
   <h3> ÁREA DO USUARIO EM CONSTRUCAO </h3>
   </div>
   
   </div>
   
 <!--#Include file="footer.asp"-->
 
</body>
</html>