<%@LANGUAGE="VBSCRIPT"%>
<%

If NOT Session("logadoA") = true Then
Response.redirect("login_adm.asp")
Response.End
End If  
	 
	 
  Set conexao = Server.CreateObject("ADODB.Connection")
  conexao.open="Provider=Microsoft.ACE.OLEDB.12.0;Data Source="& Server.MapPath("buscateca.accdb")

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

<SCRIPT LANGUAGE = "JavaScript">
    
      function VerificaL() {

 
    
  var TITULO  	= document.FormAdmin.txtTitulo.value;  
  var ISBN    	= document.FormAdmin.txtISBN.value;  
  var PUBLICACAO= document.FormAdmin.txtPubli.value;  
  var EDICAO    = document.FormAdmin.txtEdicao.value;  
  var FORMATO  	= document.FormAdmin.txtFormato.value;  
  var PAGINAS  	= document.FormAdmin.nPag.value;  
  var SINOPSE  	= document.FormAdmin.txtSinopse.value;  
  var TRADUCAO  = document.FormAdmin.txtTrad.value;  
  
   erro = "";
	
	
	if (TITULO == "")
		erro = erro +"* Digitar um Titulo \n";
	if (ISBN == "")
		erro = erro +"* Digitar o ISBN \n";
   	if (PUBLICACAO == "")
		erro = erro +"* Digitar a Publicação \n";	
	if (EDICAO == "")
		erro = erro +"* Digitar o nº de Edição \n";	
	if (FORMATO == "")
		erro = erro +"* Digitar o Formato \n";
	if (PAGINAS == "")
		erro = erro +"* Digitar o nº de paginas \n";	
	if (SINOPSE == "")
		erro = erro +"* Digitar a Sinopse \n";
	
	if (erro != "")
	{
		alert("É necessário: \n" + erro);
		return false;
	}
    
}    
	
    </SCRIPT>
 
  <!--#Include file="topoadm.asp"-->   
  <!-- DIV CONTENT -->
   
   <div id="content2">   
    
   <h2 align="center"><font color="#FF0000">Cadastro de Livros</font></h2>
   
<form name="FormAdmin" method="post" action="inserir_livro.asp" onSubmit="return VerificaL(this);">

  <div id="formadm">     
<dl>
 <dt><b>Biblioteca:</b></dt>
 <dd>
 <select name="biblioteca">
 <%
 sql = "Select * from biblioteca"
 Set rs = conexao.execute(sql)
 do while not rs.eof
 %>
  <option value="<%=rs.fields("bibliotecaId")%>"><%=rs.fields("biblioteca")%></option>
 <%
 rs.movenext
 loop
 %>
 </select>
 </dd>
 <dt><b>Titulo:</b></dt>
 <dd><input name="txtTitulo" type="text" id="txtTitulo" size="35" maxlength="60"></dd>
 <dt><b>Autor:</b></dt>
 <dd>
 <select name="autor">
 <%
 sql = "Select * from autor"
 Set rs = conexao.execute(sql)
 do while not rs.eof
 %>
  <option value="<%=rs.fields("autorId")%>"><%=rs.fields("nome")%></option>
 <%
 rs.movenext
 loop
 %>
 </select>
 </dd>
 <dt><b>Editora:</b></dt>
 <dd>
  <select name="editora">
 <%
 sql = "Select * from editora"
 Set rs = conexao.execute(sql)
 do while not rs.eof
 %>
  <option value="<%=rs.fields("editoraId")%>"><%=rs.fields("editora")%></option>
 <%
 rs.movenext
 loop
 %>
 </select>
 </dd>
 
 <dt><b>ISBN:</b></dt>
 <dd><input name="txtISBN" type="text" id="txtISBN" size="15" maxlength="15"></dd>      
 <dt><b>Idioma:</b></dt>
 <dd>
 
 <select name="idioma">
 <%
 sql = "Select * from idioma"
 Set rs = conexao.execute(sql)
 do while not rs.eof
 %>
  <option value="<%=rs.fields("idiomaId")%>"><%=rs.fields("idioma")%></option>
 <%
 rs.movenext
 loop
 %>
 </select>
 </dd>
 <dt><b>Categoria:</b></dt>
 <dd>
 <select name="categoria">
 <%
 sql = "Select * from categoria"
 Set rs = conexao.execute(sql)
 do while not rs.eof
 %>
  <option value="<%=rs.fields("categoriaId")%>"><%=rs.fields("categoria")%></option>
 <%
 rs.movenext
 loop
 %>
 </select>
 </dd>
 <dt><b>Publicação:</b></dt>
 <dd><input name="txtPubli" type="text"  id="txtPubli" size="15" maxlength="4"></dd>
 <dt><b>Tradutor:</b></dt>
 <dd><input name="txtTrad" type="text" id="txtTrad" size="35" maxlength="60"></dd>
 <dt><b>Edição:</b></dt>
 <dd><input name="txtEdicao" type="text" id="txtEdicao" size="7" maxlength="3"></dd>
 <dt><b>Formato:</b></dt>
 <dd><input name="txtFormato" type="text" id="txtFormato" size="7" maxlength="10"></dd>
 <dt><b>Paginas:</b></dt>
 <dd><input name="txtPag" type="text" id="nPag" size="7" maxlength="4"></dd>
 <dt><b>Sinopse:</b></dt>
 <dd><textarea name="txtSinopse" rows="6" cols="35"></textarea></dd>
 <dt><b>Capa:</b></dt>
 <dd><input name="txtCapas" type="text" id="txtPag" size="15" maxlength="40"></dd>
 <dt><b>Qtd Acervo:</b></dt>
 <dd><input name="txtQtd" type="text" id="txtQtd" size="5" maxlength="5"></dd><br />
 
 <dd><p align="center"><input type="submit"  name="enviar" value="Enviar">&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Limpar" /></p></dd><br />
 
</dl>
   </div>
</form>
   </div>   
   </div>
   
 <!--#Include file="footer.asp"-->
 
</body>
</html>