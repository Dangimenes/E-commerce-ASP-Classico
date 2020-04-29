<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Buscateca Livros</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->
</head>

<body>

 <!--#Include file="topoadm.asp"-->        
   <!-- DIV CONTENT -->

   <div id="content2">
    <!--#Include file="conexao.inc"-->
<%
   dim listarL
   set listarL = Server.CreateObject("ADODB.Recordset")
   Const numpag=8
   listarL.CursorLocation=3
   listarL.open " SELECT l.livroId as livroid, l.titulo, l.isbn, l.ano, l.npag, l.sinopse, l.tradutor,l.acabamento, l.formato, l.edicao, l.capas,l.ativo , c.categoria, i.idioma, b.biblioteca, a.nome, e.editora FROM (((((livro l INNER JOIN categoria c ON l.categoriaid = c.categoriaid)INNER JOIN biblioteca b ON l.bibliotecaid = b.bibliotecaid)INNER JOIN idioma i ON l.idiomaid = i.idiomaid)INNER JOIN autor a ON l.autorid = a.autorid)INNER JOIN editora e ON l.editoraid = e.editoraid)", conexao
   
   intCurrPage=cint(Request.QueryString("CurrPage"))

   if intCurrPage=0 then intCurrPage=1
   
   
   
%>
<div align="center">
    <h1>Controle de ativação livro</h1>
    
  <ul id="results">
  <form method = "get" action = "inativar_livros.asp" id ="formexcluir">
 
 <%
 
 IF listarL.EOF then 
        Response.Write "<div align=""center"" class=""TextoNegritoCinzaEscuro"">NENHUMA COBERTURA CADASTRADA</span></div>"
	 else
	 	listarL.PageSize=numpag
		listarL.AbsolutePage=intCurrPage
     end if 
	 
	 a=0 
     i=0
      while a < numpag and not listarL.EOF
     a=a+1
     i=i+1

  
 %>
       <li>

        <h2><b>Titulo:</b> <%=listarL("titulo")%> </h2> 

        <div class="imgProd">
          <span> 
            <img src="imagens/capas/<%=listarL("capas")%>" />
          </span> 
        </div>
	    
	<div class="infoProd">
	 
        <b>Autor:     </b> <%=listarL.Fields("nome")%> </br>
        <b>Editora:   </b> <%=listarL.Fields("editora")%>  </br>
        <b>Idioma:    </b> <%=listarL.Fields("idioma")%>  </br>
        <b>Categoria: </b> <%=listarL.fields("categoria")%>  </br>
		<b>ISBN:      </b> <%=listarL("isbn")%>   </br>
        <b>Publicação:</b> <%=listarL("ano")%>  </br>
        <b>Formato:   </b> <%=listarL("formato")%>  </br>
        <b>Paginas:   </b> <%=listarL("npag")%>  </br>
        <b>Ediçao:    </b>  <%=listarL("edicao")%>  </br>
		<b>Ativo:  </b> <%=listarL("ativo")%>< </br>
	    <b>Biblioteca:</b> <a href = "bibliotecas.asp"> <%=listarL.fields("biblioteca")%> </a>

   </div>

         <div class="sinopse"> 
           <p><b>Sinopse:</b><%=listarL("sinopse")%></p>  </br>
         </div>
         
		<a href = "ativar_livros.asp?<%=listarL("livroid")%> " class = "submit"> ATIVAR </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href = "inativar_livros.asp?<%=listarL("livroid")%> " class = "submit"> INATIVAR </a>
		
    <%
       listarL.movenext
        wend
    %>

	</form>
 </li>
 
 <div class="paginacaoResultado"><b>Páginas:</b>
<%
for a = 1 to listarL.PageCount
if a <> intCurrPage then 
Response.Write "<a class=""LinkVermelhoNegrito"" href='"&pagina&"?Currpage=" & a & "'>" & a & "</a>"
else
Response.Write "<span><b>" & a & "</b></span>"
end if
next
%>
 </div>
  
 </ul>
 </div> 
 </div>

  <!--#Include file="footer.asp"-->

</body>
</html>

