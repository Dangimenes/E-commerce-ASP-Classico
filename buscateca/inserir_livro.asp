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
   inserir.open "livro", conexao ,3,3
   comandoSQL= "INSERT INTO livro (titulo,isbn,idiomaId,autorId,editoraId,ano,npag,bibliotecaId,categoriaId,sinopse,tradutor,formato,edicao,capas,qtd_acervo)"
   comandoSQL= comandoSQL & "VALUES (" 
   comandoSQL= comandoSQL & "'" & Request.Form("txtTitulo") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("txtISBN") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("idioma") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("autor") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("editora") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("txtPubli") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("nPag") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("biblioteca") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("categoria") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("txtSinopse") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("txtTrad") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("txtformato") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("txtEdicao") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("txtcapas") & "',"
   comandoSQL= comandoSQL & "'" & Request.Form("txtQtd") & "')"
   
   response.Write(comandoSQL)
   set bd = Conexao.Execute(ComandoSQL) 
   'inserir.update
   conexao.close
   'inserir.close
   set inserir = nothing
   set conexao = nothing
   
   response.Redirect("admin.asp")
   
%>

</body>
</html>
