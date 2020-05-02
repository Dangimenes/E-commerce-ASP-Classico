<%

session("session_id") = session.sessionid

Set conexao = Server.CreateObject("ADODB.Connection")

conexao.open="Provider=Microsoft.ACE.OLEDB.12.0;Data Source="& Server.MapPath("buscateca.accdb")
%>