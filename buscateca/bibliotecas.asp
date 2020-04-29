<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Buscateca Bibliotecas</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->
</head>
<body>

 <!--#Include file="topo.asp"-->     
 <!-- DIV CONTENT -->   
 
    <div id="content2">
   
   <!--#Include file="conexao.inc"-->
<%
   dim listarB
   set listarB = Server.CreateObject("ADODB.Recordset")
   listarB.open " SELECT * FROM biblioteca", conexao
   
%>
<div align="center">
    <h1>Bibliotecas:</h1>
    
  <ul id="resultsBiblio">
  
 <%
  while not listarB.EOF 
 %>
        <li> 
        
         <div class="imgProd">            
          <span> 
            <img src="imagens/bibliotecas/<%=listarB("fotobiblio")%>" /> 
          </span> 
        </div></br> 
         
        <dd><b>Nome:    </b>  <%=listarB("biblioteca")%></dd>
		<dd><b>Endere&ccedil;o:</b>  <%=listarB("endereco")%></dd>
        <dd><B>Bairro:  </B>  <%=listarB("numero")%></dd>		
        <dd><B>Bairro:  </B>  <%=listarB("bairro")%></dd>
        <dd><B>Telefone:</B>  <%=listarB("fone")%></dd>        
        <dd><B>nº:</B>  <%=listarB("numero")%></dd>        
        <dd><B>CEP:</B>  <%=listarB("cep")%></dd></br>
        <dd><B></B><a href="<%=listarB("mapa")%>" target="_blank">Exibir Mapa</a>
        
        </li>
		
        
<%listarB.movenext
     wend
%> 
 </ul>
 
 </div> 
 </div>
 <!--#Include file="footer.asp"-->
 
</body>
</html>
