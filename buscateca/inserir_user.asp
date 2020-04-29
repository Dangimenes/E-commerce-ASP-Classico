<%@LANGUAGE="VBSCRIPT"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>

<!--#Include file="conexao.inc"-->

<%
   dim inserir
   set inserir = Server.CreateObject("ADODB.Recordset")
   inserir.open " cadastro_usuarios", conexao,3,3
   inserir.addnew
   inserir("login")    = request.form("txtLogin")
   inserir("senha")    = request.form("txtSenha")
   inserir("nome")     = request.form("txtNome")
   inserir("email")    = request.form("txtMail")
   inserir("rg")       = request.form("txtRG")
   inserir("fone")     = Request.form("txtDDD") &"-"& Request.form("txtFone")
   inserir("endereco") = request.form("txtEnd")
   inserir("cidade")   = request.form("txtCidade")
   'inserir("estado") = request.form("txtEstado")
   inserir("cep")      = request.form("txtCep1") &"-"& Request.form("txtCep2")
   inserir.update
   conexao.close
   set inserir = nothing
   set conexao = nothing
   
   Response.Redirect("login_user.asp")
   
%>

</body>
</html>
