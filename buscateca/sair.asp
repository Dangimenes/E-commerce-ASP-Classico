<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
If not Session("logado") = true then
	 Response.redirect("index.asp")
   End if
	 session.Abandon()
	 Response.redirect("index.asp")
	
%>	