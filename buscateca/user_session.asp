<%@LANGUAGE="VBSCRIPT" %>

<%
Dim login, senha, conexao, sql, rs 
 
login = Request.Form("login")
senha = Request.Form("senha")

  Set conexao = Server.CreateObject("ADODB.Connection")

  conexao.open="Provider=Microsoft.ACE.OLEDB.12.0;Data Source="& Server.MapPath("buscateca.accdb")

sql = "SELECT * FROM cadastro_usuarios WHERE login='" & login & "' AND senha='" & senha & "'"
Set rs = conexao.Execute(sql)

If rs.EOF Then
login = false
Else
login = true
End If

If login = true Then
	Session("logado") = true
	session("userid") = rs("usuarioid")
			
			if Session("history") then
			Response.redirect("historyUser.asp")
			Session ("history") = false
			 end if
		if session("pagefinalizar") then
			'session("finalizar")=true
			Response.redirect("finalizar.asp")
		else
			session("pagefinalizar")=false
			Response.redirect("index.asp")
		end if
Else
Session("logado") = 2
Response.redirect("login_user.asp")

End If
%>