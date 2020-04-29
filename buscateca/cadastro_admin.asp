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
    
      function Verifica() {

 
  var LOGIN  = document.FormCadastro.txtLogin.value;  
  var SENHA  = document.FormCadastro.txtSenha.value;  
  var EMAIL  = document.FormCadastro.txtMail.value;  
  var NOME   = document.FormCadastro.txtNome.value;
  var RG     = document.FormCadastro.txtRG.value;
  
   erro = "";
	
	if (LOGIN == "")
		erro = "* Digitar um Login \n";
	if (SENHA == "")
		erro = erro +"* Digitar uma senha \n";
	if (EMAIL == "")
		erro = erro +"* Digitar seu e-mail \n";
	if (NOME == "")
		erro = erro +"* Digitar seu Nome \n";
    if (RG == "")
		erro = erro +"* Digitar seu RG \n";	
	if (erro != "")
	{
		alert("É necessário: \n" + erro);
		return false;
	}

if (EMAIL.indexOf('@') == -1 || EMAIL.indexOf('.') == -1) {

    alert ('Coloque um e-mail válido!');

    document.FormCadastro.txtMail.value = '';

    document.FormCadastro.txtMail.focus();

    return false;

    }
	
		
	if (((document.FormCadastro.txtLogin.value.length <= 4) || (document.FormCadastro.txtLogin.value.length > 12)))
		erro = "O login deve ter no mínimo 5 caracteres e no máximo 12. \n";
	if (((document.FormCadastro.txtSenha.value.length <= 4) || (document.FormCadastro.txtSenha.value.length > 12)))
		erro = erro + "A senha deve ter no mínimo 5 caracteres e no máximo 12.";
    if (((document.FormCadastro.txtNome.value.length <= 6) || (document.FormCadastro.txtNome.value.length > 60)))
		erro = "O Nome deve ter no mínimo 6 caracteres. \n";
    if (((document.FormCadastro.txtRG.value.length <= 8) || (document.FormCadastro.txtRG.value.length > 10)))
		erro = "O Número do RG deve ter no mínimo 9 caracteres. \n";
	if (erro != "") 
	{
		alert("Atenção: \n" + erro);
		return false;
	}
	
	
	
  }
    
	
    </SCRIPT>
 
 <!--#Include file="topoadm.asp"-->
   
   

    <h2 align="center"><font color="#FF6666">Cadastro de Administrador:</font></h2>

   <div class="formCadastro">  
   
   <form name="FormCadastro" method="post" action="inserir_admin.asp" onSubmit="return Verifica(this);">
       
<dl>
 <dt><b>Login:&nbsp;&nbsp;</b></dt>
 <dd><input name="txtLogin" type="text" id="txtLogin" size="12" maxlength="12"></dd>
 <dt><b>Senha:&nbsp;</b></dt>
 <dd><input name="txtSenha" type="password" id="txtSenha" size="12" maxlength="12"></dd>
 <dt><b>Nome:&nbsp;&nbsp;</b></dt>
 <dd><input name="txtNome" type="text" id="txtNome" size="40" maxlength="255"></dd>
 <dt><b>Email:&nbsp;&nbsp;&nbsp;</b></dt>
 <dd><input name="txtMail" type="text" id="txtMail" size="40" maxlength="255"></dd>      
 <dt><b>&nbsp;RG:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></dt>
 <dd><input name="txtRG" type="text" id="txtRG" size="12" maxlength="12"></dd>
 <dt><b>Fone:&nbsp;&nbsp;&nbsp;</b></dt>
 <dd><input name="txtDDD" type="text" id="txtDDD" size="3" maxlength="3"> - <input name="txtFone" type="text" id="txtFone" size="8" maxlength="10"></dd>
 <dt><b>End.:&nbsp;&nbsp;&nbsp;&nbsp;</b></dt>
 <dd><input name="txtEnd" type="text" id="txtEnd" size="40" maxlength="255"></dd>
 <dt><b>Cidade:&nbsp;</b></dt>
 <dd><input name="txtCidade" type="text" id="txtCidade"></dd>
 <dt><b>CEP:&nbsp;&nbsp;&nbsp;&nbsp;</b></dt>
 <dd><input name="txtCep1" type="text" id="txtCep1" size="5" maxlength="5"> - <input name="txtCep2" type="text" id="txtCep2" size="3" maxlength="3"></dd>
 <br />
 <dd><input class="submit" type="submit" value="Enviar">&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input class="submit" type="reset" value="Limpar" /></dd><br />
 
</dl> 
   </form>
   
   </div>  

 <!-- DIV FOOTER -->

 <!--#Include file="footer.asp"-->
 
</body>
</html>

