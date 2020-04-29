<%@LANGUAGE="VBSCRIPT" %>
<%

Dim login, senha, conexao, sql, rs 
 
login = Request.Form("login")
senha = Request.Form("senha")

  Set conexao = Server.CreateObject("ADODB.Connection")

  conexao.open="Provider=Microsoft.ACE.OLEDB.12.0;Data Source="& Server.MapPath("buscateca.accdb")

sql = "SELECT * FROM cadastro_admin WHERE login='" & login & "' AND senha='" & senha & "'"
Set rs = conexao.Execute(sql)

If rs.EOF Then
login = false
Else
login = true
End If

If login = true Then
session("login") = rs("login")
session("senha") = rs("senha")
Session("logadoA") = true
Response.redirect("admin.asp")

Else
Session("logadoA") = 2
Response.redirect("login_adm.asp")

End If
%>