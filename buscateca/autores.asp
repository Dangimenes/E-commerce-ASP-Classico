<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Buscateca Autores</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->
</head>

<body>
 
 <!--#Include file="topo.asp"-->
   
   
 <!-- DIV CONTENT -->
   
   <div id="content2">
   <!--#Include file="conexao.inc"-->
<%
   dim listarA
   set listarA = Server.CreateObject("ADODB.Recordset")
   Const numpag=20
   listarA.CursorLocation=3
   listarA.open " SELECT * FROM autor", conexao

   
   intCurrPage=cint(Request.QueryString("CurrPage"))

   if intCurrPage=0 then intCurrPage=1
   
%>
    
   <h1 style="text-align:center;">Autores:</h1>

  <dl id="resultsA">
  
  <div id = "autores" >
  
 <%

        IF listarA.EOF then 
        Response.Write "<div align=""center"" class=""TextoNegritoCinzaEscuro"">NENHUMA COBERTURA CADASTRADA</span></div>"
	  else
	 	listarA.PageSize=numpag
		listarA.AbsolutePage=intCurrPage
     end if 

    a=0 
    i=0
      while a < numpag and not listarA.EOF
    a=a+1
    i=i+1

   %>       

  <tr>
	<td>
		
		<dd> <b> <a href = "resultadoautor.asp?<%=listarA("autorid")%> " class = "linksfields"> <%=listarA("nome")%> </a></b></dd>
		
	</br>     
    </td>
	</tr> 
<%
     listarA.movenext
     wend
%>

        <div class="paginacaoResultado"><b>Páginas:</b>
<%
for a = 1 to listarA.PageCount
if a <> intCurrPage then 
Response.Write "<a class=""LinkVermelhoNegrito"" href='"&pagina&"?Currpage=" & a & "'>" & a & "</a>"
else
Response.Write "<span><b>" & a & "</b></span>"
end if
next
%>
         </div>
	
 </dl>
 </div>    
 <!--#Include file="footer.asp"-->
 
</body>
</html>
