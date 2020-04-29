<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"" />
<title>Buscateca resultados da pesquisa</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->
</head>

<body>
 <div id="header">
 <div id="menu">
 <font color="#FFFFFF">
 <ul>
  <li><a href="login.asp">Login</a></li>  
  <li><a href="categoria.asp">Categorias</a></li>
  <li><a href="autores.asp">Autores</a></li>
  <li><a href="livros.asp">Livros</a></li>
  <li><a href="bibliotecas.asp">Bibliotecas</a></li>  
  <li><a href="index.asp">Home</a></li>
 </ul>
 </font>
 </div>
 </div>

<div id="main2">

<div id="banner2"> </div>

<div id="content2"> 
   
   <!--#Include file="conexao.inc"--> 
       
	<%
    Dim Sql
    %>
	<%
    Sql = "SELECT * FROM categoria"
    
       Set RsWeb = Server.CreateObject("ADODB.Recordset")
       RsWeb.Open Sql, conexao, 3
    %>    
    <div align="center">
    
    <h2>Busca avançada</h2>
    
    <dl id="results">
    
    <dd><p align="left">    
    <% do while not RsWeb.eof%>
    <font face="Verdana, Geneva, sans-serif" size="4" color="black">Por Categoria: </font><select>
    <option name="categoria" value="<%=RsWeb.fields("categoriaId")%>"><%=RsWeb.Fields("categoria")%></option>
    <%
    RsWeb.movenext
    Loop
    %>
    </select></p>
    </dd>
    
	<%
    Sql = "SELECT * FROM idioma"
    
       Set RsWeb = Server.CreateObject("ADODB.Recordset")
       RsWeb.Open Sql, conexao, 3
    %>
    <dd><p align="left">
    <font face="Verdana, Geneva, sans-serif" size="4" color="black">Por Idioma: </font><select>
    <% do while not RsWeb.eof%>
    <option name="categoria" value="<%=RsWeb.fields("idiomaId")%>"><%=RsWeb.Fields("idioma")%></option>
    <%
    RsWeb.movenext
    Loop
    %>
    </select></p>
    </dd>
    
	<%
    Sql = "SELECT livroId, autor FROM livro"
    
       Set RsWeb = Server.CreateObject("ADODB.Recordset")
       RsWeb.Open Sql, conexao, 3
    %>
    <dd><p align="left">  
    <font face="Verdana, Geneva, sans-serif" size="4" color="black">Por Autor: </font><select>
    <% do while not RsWeb.eof%>
    <option name="categoria" value="<%=RsWeb.fields("livroId")%>"><%=RsWeb.Fields("autor")%></option>
    <%
    RsWeb.movenext
    Loop
    %>
    </select></p>
    </dd>
      
    <%
    Sql = "SELECT livroId, editora FROM livro"
    
       Set RsWeb = Server.CreateObject("ADODB.Recordset")
       RsWeb.Open Sql, conexao, 3
    %>
    <dd><p align="left">  
    <font face="Verdana, Geneva, sans-serif" size="4" color="black">Por Editora: </font><select>
    <% do while not RsWeb.eof%>
    <option name="categoria" value="<%=RsWeb.fields("livroId")%>"><%=RsWeb.Fields("editora")%></option>
    <%
    RsWeb.movenext
    Loop
    %>
    </select>
    </dd>        
    </dl>
    </div>            
</div>		
   
<div id="menu2">
 <ul>   
  <li><a href="index.asp" class="m2">Home</a></li>
  <li><a href="bibliotecas.asp" class="m2">Bibliotecas</a></li> 
  <li><a href="livros.asp" class="m2">Livros</a></li>
  <li><a href="autores.asp" class="m2">Autores</a></li>
  <li><a href="categoria.asp" class="m2">Categorias</a></li>
  <li><a href="login.asp" class="m2">Login</a></li> 
 </ul>
</div>

</div>
</div>
 <div id="footer"></div>

</body>
</html>
