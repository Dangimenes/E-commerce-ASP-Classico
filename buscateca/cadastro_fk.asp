<%
cad=request.querystring("cad")

%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Buscateca Administração</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />

</head>
 <body> 
 <!--#Include file="topoadm.asp"-->  
   
   <!-- DIV CONTENT -->

   <div id="content2">
   <%
	select case cad
	case "biblio"
%> 
   <h2 align="center">Cadastrar uma nova Biblioteca</h2>
   
   <div class="formCadastro">  
   <form name="FormCadastro" method="post" action="funcoes.asp?acao=incluirbiblioteca">
  
   
 <dt><b>Biblioteca:&nbsp</b></dt>
 <dd><input name="txtBibli" type="text" id="txtBibli" size="12" maxlength="60" required ></dd>
 <dt><b>Endereco:&nbsp;</b></dt>
 <dd><input name="txtEnd" type="text" id="txtEnd" size="12" maxlength="60" required></dd>
 <dt><b>Numero:&nbsp;&nbsp;</b></dt>
 <dd><input name="txtNum" type="text" id="txtNum" size="10" maxlength="5" required></dd>
 <dt><b>Bairro:&nbsp;&nbsp;&nbsp;</b></dt>
 <dd><input name="txtBairro" type="text" id="txtBairro" size="40" maxlength="60" required></dd>      
 <dt><b>CEP:&nbsp;&nbsp;&nbsp;&nbsp;</b></dt>
 <dd><input name="txtCep1" type="text" id="txtCep1" size="3" maxlength="3" required> - <input name="txtCep2" type="text" id="txtCep2" size="5" maxlength="5" required></dd>
 <dt><b>Fone:&nbsp;&nbsp;&nbsp;</b></dt>
 <dd><input name="txtDDD" type="text" id="txtDDD" size="3" maxlength="3"> - <input name="txtFone" type="text" id="txtFone" size="8" maxlength="10"></dd>
 <dt><b>Cidade:&nbsp;</b></dt>
 <dd><input name="txtCidade" type="text" id="txtCidade" required></dd>
 <dt><b>Foto:&nbsp;&nbsp;&nbsp;&nbsp;</b></dt>
 <dd><input name="txtFoto" type="text" id="txtFoto" required></dd>
 <dt><b>Mapa:&nbsp;&nbsp;&nbsp;</b></dt>
 <dd><input name="txtMapa" type="text" id="txtMapa" ></dd>
 <dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="submit" type="submit" value="Enviar">&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input class="submit" type="reset" value="Limpar" /></dd>
   </form>
   </div></br></br>
  <% 
		case "autor"  
	%>
   <h2 align="center">Cadastrar um novo Autor</h2>
   <div class="formCadastro">       
   
   <form name="FormAutor" method="post" action="funcoes.asp?acao=incluirautor">
       
 <dt><a name="autor"><b>Autores:&nbsp</b></a></dt>
 <dd><input name="txtAutor" type="text" id="txtAutor" size="12" maxlength="60" required></dd>
 <dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="submit" type="submit" value="Enviar">&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input class="submit" type="reset" value="Limpar" /></dd>
   </form>
   </div>
    <% 
		case "editora"  
	%>
   <h2 align="center">Cadastrar uma nova Editora</h2>
   <div class="formCadastro">
   <form name="FormCadastro" method="post" action="funcoes.asp?acao=incluireditora">
       
 <dt><a name="editora"><b>Editora:&nbsp</b></a></dt>
 <dd><input name="txtEditora" type="text" id="txtEditora" size="12" maxlength="60" required></dd>
 <dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="submit" type="submit" value="Enviar">&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input class="submit" type="reset" value="Limpar" /></dd>  
   </form>
   </div>
    <% 
		case "idioma"  
	%>
   <h2 align="center">Cadastrar um novo Idioma</h2>
   <div class="formCadastro"> 
   <form name="FormCadastro" method="post" action="funcoes.asp?acao=incluiridioma">
       
 <dt><a name="idioma"><b>Idioma:&nbsp</b></a></dt>
 <dd><input name="txtIdioma" type="text" id="txtIdioma" size="12" maxlength="60" required></dd>
 <dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="submit" type="submit" value="Enviar">&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input class="submit" type="reset" value="Limpar" /></dd>  
   </form>
   </div>
    <% 
		case "cat"  
	%>
   <h2 align="center">Cadastrar uma nova Categoria</h2>
   <div class="formCadastro"> 
   <form name="FormCadastro" method="post" action="funcoes.asp?acao=incluircategoria">
       
 <dt><a name="categoria"><b>Categoria:&nbsp</b></a></dt>
 <dd><input name="txtCategoria" type="text" id="txtCategoria" size="12" maxlength="60" required></dd>
 <dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="submit" type="submit" value="Enviar">&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input class="submit" type="reset" value="Limpar" /></dd>  
   </form>   
   </div>
   
   </div>
   <br/><br>
   
<% end select %>

 <!--#Include file="footer.asp"-->
</body>
</html>
