<%@LANGUAGE="VBSCRIPT"%>

<!--#Include file="conexao.inc"-->

<%
If NOT Session("logadoA") = true Then
Response.redirect("login_adm.asp")
Response.End
End If	 
	 
%>	 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Atualizacao de Livros</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->
</head>
<body>

   <!--#Include file="topoadm.asp"-->    
   <!-- DIV CONTENT --> 
    
   <h2 align="center"><font color="#FF6666">Atualização de Livros</font></h2>   
   <div class="center">   
   <!--#Include file="conexao.inc"-->

<%
   dim listarL
   
   set listarL = Server.CreateObject("ADODB.Recordset")
   Const numpag=8
   listarL.CursorLocation=3
   
   listarL.open " SELECT * FROM livro", conexao
   
   intCurrPage=cint(Request.QueryString("CurrPage"))

   if intCurrPage=0 then intCurrPage=1
   
%>
    
    <ul>  
    <h2>Livros</h2>    
    <hr />
  
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
        <div class="imgProdAtualizar">
            
          <span> 
            <img src="imagens/capas/<%=listarL("capas")%>"  /> 
          </span>          
          
        </div>         
        
        <b> <%=listarL("titulo")%> </b>
        
        <a href = "atualiza_livro.asp?id=<%=listarL("livroid")%> "> Atualizar </a>
        
    </li>
	     
<% 
 listarL.movenext
   wend
%>
       
    <div class="paginacao"><b>Páginas:</b>
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
    <!--#Include file="footer.asp"-->    
</body>
</html>
