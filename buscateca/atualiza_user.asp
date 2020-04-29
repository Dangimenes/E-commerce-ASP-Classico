<%@LANGUAGE="VBSCRIPT"%>
<!-- #include file="conexao.inc" -->
	 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Atualização de Cadastro</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#Include file="jquerymenu.inc"-->
</head>
<body>
 <!--#Include file="topo.asp"-->  
   
   <!-- DIV CONTENT --> 

   <div id="content5">      
   <h2 align="center"><font color="#FF0000">Atualização de Cadastro</font></h2>
   
<%if (Session("logado") = true) then%>
<%
  dim conexao, id, rs, sql
  id= Request.QueryString("id")
  sql= "SELECT * from cadastro_usuarios WHERE usuarioid=" & session("userid") 
  set rs=conexao.execute(sql)  
  
%>

<form name="FormAdmin" method="post" action="update_user.asp" onSubmit="return VerificaL(this);">

 
  <input type="hidden" name="id_user" id="id_user" value="<% = rs("usuarioId")%>" />     
 <dl>
 
 <label for="txtNome"><b>Nome:</b></label>
 <input name="txtNome" type="text" id="txtNome" size="30" value="<% = rs.fields("nome")%>">
<br>
<br>

 <label for="txtLogin"><b>Login:</b></label>
 <input name="txtLogin" type="text" id="txtLogin" size="10" value="<% = rs.fields("login")%>">
 <br>
 <br>
 
 <label for="txtSenha"><b>Senha:</b></label>
 <input name="txtSenha" type="text"  id="txtSenha" size="10" value="<% = rs.fields("senha")%>">
 <br>
 <br>
 
 
 <label for="txtEmail"><b>Email:</b></label>
 <input name="txtEmail" type="text" id="txtEmail" size="30" value="<% = rs.fields("email")%>">
 <br>
 <br>
 
 <label for="txtRg"><b>RG:</b></label>
 <input name="txtRG" type="text" id="txtRG" size="10" value="<% = rs.fields("rg")%>">
 <br>
 <br>
 
 <label for="txtFone"><b>Fone:&nbsp;&nbsp;&nbsp;</b></label>
 <input name="txtFone" type="text" id="txtFone" size="10" value="<% = rs.fields("fone")%>">
 <br>
 <br>
 
 <label for="txtEndereco"><b>Endereço:</b></label>
 <input name="txtEnd" type="text" id="txtEnd" size="30"  value="<%=rs.fields("endereco")%>">
 <br>
 <br>
 
 <label for="txtCidade"><b>cidade:</b></label>
 <input name="txtCid" type="text" id="txtCid" size="10"  value="<% = rs.fields("cidade")%>"> 
 <br>
 <br>
 
 <label for="txtCep"><b>CEP:&nbsp;&nbsp;&nbsp;&nbsp;</b></label>
 <input name="txtCep" type="text" id="txtCep" size="10" maxlength="" value="<% = rs.fields("cep")%>">
 <br>
 <br>
 
 <dd><p align="center"><input type="submit"  name="enviar" value="Enviar">&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;</p></dd><br />
 
</dl>

</form>

<%end if%>

</div>      
 <!--#Include file="footer.asp"--> 
</body>
</html>
