<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Buscateca Categoria</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->

</head>
<body>

 
 <!--#Include file="topo.asp"-->  
   
   <!-- DIV CONTENT -->
   
   <div id="content2">
    <!--#Include file="conexao.inc"-->
<%
   dim listarC
   set listarC = Server.CreateObject("ADODB.Recordset")
   Const numpag=20
   listarC.CursorLocation=3
   listarC.open " SELECT * FROM categoria  ", conexao
   

   intCurrPage=cint(Request.QueryString("CurrPage"))

   if intCurrPage=0 then intCurrPage=1
%>

    <h1 style="text-align:center;">Categorias:</h1>

  <dl id="resultsC">
  <div id = "categorias">
      
 <%

        IF listarC.EOF then 
        Response.Write "<div align=""center"" class=""TextoNegritoCinzaEscuro"">NENHUMA COBERTURA CADASTRADA</span></div>"
	  else
	 	listarC.PageSize=numpag
		listarC.AbsolutePage=intCurrPage
     end if 

    a=0 
    i=0
      while a < numpag and not listarC.EOF 
    a=a+1
    i=i+1

   %>       
       
		<dd><b> <a href = "resultadocategoria.asp?<%=listarC("categoriaid")%>" class= "linksfields"> <%=listarC("categoria")%> </a> </b></dd>            
        </br>
         
<%
     listarC.movenext
     wend
%>


        <div class="paginacaoResultado"><b>Páginas:</b>
<%
for a = 1 to listarC.PageCount
if a <> intCurrPage then 
Response.Write "<a class=""LinkVermelhoNegrito"" href='"&pagina&"?Currpage=" & a & "'>" & a & "</a>"
else
Response.Write "<span><b>" & a & "</b></span>"
end if
next
%>
         </div>

 </br>
 </dl>
 </div>
 </div>  
 <!--#Include file="footer.asp"-->
   
</body>
</html>
