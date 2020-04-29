<%@LANGUAGE="VBSCRIPT"%>
<!-- #include file="conexao.inc" -->
<%
If NOT Session("logadoA") = true Then
Response.redirect("login_adm.asp")
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
 <!--#Include file="topoadm.asp"-->  
   
   <!-- DIV CONTENT -->
 

   <div id="content2">   
    
   <h2 align="center"><font color="#FF0000">Atualização de Livros</font></h2>

<%
  dim conexao, id, rs, sql
  id= Request.QueryString("id")
  sql = "SELECT l.livroid, l.ativo, l.titulo, l.isbn, l.ano, l.npag, l.sinopse, l.tradutor,l.acabamento, l.formato, l.edicao, l.capas, l.qtd_acervo, c.categoria, c.categoriaid, i.idioma, b.biblioteca, b.bibliotecaid, a.nome, a.autorid, e.editora, e.editoraid, i.idioma, i.idiomaid  FROM (((((livro l INNER JOIN categoria c ON l.categoriaid = c.categoriaid)INNER JOIN biblioteca b ON l.bibliotecaid = b.bibliotecaid)INNER JOIN idioma i ON l.idiomaid = i.idiomaid)INNER JOIN autor a ON l.autorid = a.autorid)INNER JOIN editora e ON l.editoraid = e.editoraid) WHERE livroid=" & id 
  set rs=conexao.execute(sql) 
  
  sql_B="Select * from biblioteca"
  set rs_B=conexao.execute(sql_B)
  
  sql_A="Select * from autor"
  set rs_A=conexao.execute(sql_A)
  
  sql_E="Select * from editora"
  set rs_E=conexao.execute(sql_E)

  sql_I="Select * from idioma"
  set rs_I=conexao.execute(sql_I)

  sql_C="Select * from categoria"
  set rs_C=conexao.execute(sql_C)
  
  resumo = replace(rs("sinopse"), "**", "'")
%>
   
<form name="FormAdmin" method="post" action="update.asp" onSubmit="return VerificaL(this);">

  <div id="formadm"><input type="hidden" name="id_livro" id="id_livro" value="<% = rs("livroid")%>"/>     
 <dl>
 <dt><b>Biblioteca:</b></dt>
 
 <dd>
 <select name="biblioteca">
  <%
  do while not rs_B.eof  
  if (rs("bibliotecaid") = rs_B("bibliotecaid")) then
  %>
    <option value="<%=rs("bibliotecaid")%>" selected><%=rs_B("biblioteca")%></option>
  <%
  else
  %> 
    <option value="<% = rs_B("bibliotecaid")%>"> <% =rs_B("biblioteca")%> </option>
  <%
    end if
	rs_B.movenext
	loop
  %>	 
 </select>
 </dd>
 
 <dt><b>Titulo:</b></dt>
 <dd><input name="txtTitulo" type="text" id="txtTitulo" size="35" maxlength="60" value="<% = rs.fields("titulo")%>"></dd>
 
 <dt><b>Autor:</b></dt>
 <dd>
 <select name="autor">
  <%
  do while not rs_A.eof
  if (rs("autorid") = rs_A("autorid")) then
  %>
  <option value="<% = rs("autorid")%>" selected> <%= rs_A("nome")%> </option>
  <%
  else
  %>
  <option value="<%=rs_A("autorId")%>"> <%=rs_A("nome")%> </option>
 <%
 end if
 rs_A.movenext
 loop
 %>
 </select>
 </dd>
 
 <dt><b>Editora:</b></dt>
 <dd>
  <select name="editora">
  <%
  do while not rs_E.eof
  if (rs("editoraid") = rs_E("editoraid")) then
  %>
  <option value="<%=rs("editoraId")%>" selected> <%=rs_E("editora")%></option>
  <%
  else
  %>
  <option value="<%=rs_E("editoraid")%>"> <%=rs_E("editora")%>
  <%
 end if
 rs_E.movenext
 loop
 %>
 </select>
 </dd>

 <dt><b>ISBN:</b></dt>
 <dd><input name="txtISBN" type="text" id="txtISBN" size="15" maxlength="15" value="<% = rs.fields("isbn")%>"></dd> 
     
 <dt><b>Idioma:</b></dt>
 <dd>
 <select name="idioma">
  <%
  do while not rs_I.eof
  if (rs("idiomaid") = rs_I("idiomaid")) then
  %>
  <option value="<%=rs("idiomaId")%>" selected> <%=rs_I("idioma")%></option>
  <%
  Else
  %>
  <option value="<%=rs_I("idiomaid")%>"> <%=rs_I("idioma")%> </option>
  <%
  end if
  rs_I.movenext
  loop
  %>
  </select>
  </dd>

 <dt><b>Categoria:</b></dt>
 <dd>
 <select name="categoria">
 <%
  do while not rs_C.eof
  if (rs("categoriaid") = rs_C("categoriaid")) then
  %>
 <option value="<%=rs("categoriaId")%>" selected> <%=rs_C("categoria")%></option>
 <%
  Else
  %>
  <option value="<%=rs_C("categoriaid")%>"> <%=rs_C("categoria")%> </option>
  <%
  end if
  rs_C.movenext
  loop
  %>
 </select>
 </dd>

 <dt><b>Publicação:</b></dt>
 <dd><input name="txtPubli" type="text"  id="txtPubli" size="15" maxlength="4" value="<% = rs.fields("ano")%>"></dd>
 <dt><b>Tradutor:</b></dt>
 <dd><input name="txtTrad" type="text" id="txtTrad" size="35" maxlength="60" value="<% = rs.fields("tradutor")%>"></dd>
 <dt><b>Edição:</b></dt>
 <dd><input name="txtEdicao" type="text" id="txtEdicao" size="7" maxlength="3" value="<% = rs.fields("edicao")%>"></dd>
 <dt><b>Formato:</b></dt>
 <dd><input name="txtFormato" type="text" id="txtFormato" size="7" maxlength="10" value="<% = rs.fields("formato")%>"> </dd>
 <dt><b>Paginas:</b></dt>
 <dd><input name="txtPag" type="text" id="nPag" size="7" maxlength="4" value="<% = rs.fields("npag")%>"> 	</dd>

 <dt><b>Sinopse:</b></dt>
 <dd><textarea name="txtSinopse" rows="8" cols="40" ><% = resumo %></textarea></dd>
 <dt><b>Capa:</b></dt>
 <dd><img src="imagens/capas/<%=rs.fields("capas")%>"</dd><br />
 <dt><b>Alterar:</b></dt>
 <dd><input name="txtCapas" type="text" id="txtCapas" size="15" maxlength="40" value="<% = rs.fields("capas")%>"></dd><br />
 <dt><b>Quantidade em acervo:</b></dt>
 <dd><input name="txtQtd" type="text" id="txtQtd" size="1"  value="<%=rs.fields("qtd_acervo")%>"></dd><br />
 <dd><p align="center"><input type="submit"  name="enviar" value="Enviar">&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Limpar" /></p></dd><br />
 
</dl>
   </div>
</form>
   </div>   
   </div>  
 <!--#Include file="footer.asp"-->
 
</div>
</body>
</html>
