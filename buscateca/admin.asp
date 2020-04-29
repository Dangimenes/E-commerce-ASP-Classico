<%@LANGUAGE="VBSCRIPT"%>

<%
Session("logado") = false
If NOT Session("logadoA") = true Then
Response.redirect("login_adm.asp")
Response.End
End If 
	 
%>	
 <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Buscateca Administração</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->
</head>

<body>
 
   <!--#Include file="topoadm.asp"-->  
   
   <!-- DIV CONTENT -->   

   <div id="content2">   
   <h2 align="center"><font color="#FF6666" face="Arial, Helvetica, sans-serif">Administrador:</font></h2> 
   <br />
   <div align="center">
   <h3><a href="cadastro_livro.asp" class="m2">Cadastro de Livros</a></h3>
   <h3><a href="selecao_livro.asp" class="m2">Atualização de Livros</a></h3>
   <h3><a href="excluir_livros_admin.asp" class="m2">Exclusão de Livros</h3>
   <h3><a href="cadastro_fk.asp?cad=biblio" class="m2">Cadastro de Bibliotecas</h3>
   <h3><a href="cadastro_fk.asp?cad=autor" class="m2">Cadastro de Autores</h3>
   <h3><a href="cadastro_fk.asp?cad=editora" class="m2">Cadastro de Editoras</h3>
   <h3><a href="cadastro_fk.asp?cad=idioma" class="m2">Cadastro de Idiomas</h3>
   <h3><a href="cadastro_fk.asp?cad=cat" class="m2">Cadastro de Categoria</h3>
   <h3><a href="cadastro_admin.asp" class="m2">Cadastro de Administradores</h3>
   <h3><a href="HistoryAdm.asp" class="m2">Histórico de Reservas</h3>
   </div>
   </div> 

 <!--#Include file="footer.asp"-->
 
</body>
</html>