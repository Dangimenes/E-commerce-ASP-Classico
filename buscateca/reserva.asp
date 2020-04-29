<!--#Include file="conexao.inc"-->  

<%

	dim conexao, acao, idsessao, idlivro, sql, rsreserva, sql2

	acao=request.querystring("acao")
	idsessao=request.querystring("id_sessao")
	idlivro=request.querystring("id_livro")

	select case acao
		
		case "sair"
		 call sair() 
		
		case "excluir"
			call exclusao()
		
		case "incluir"
			call inclusao()

	end select
	
		
	sub sair()
	Session.Abandon
	response.Redirect ("index.asp")
	end sub
	
	sub exclusao()
	sqlE= "delete from carrinho where livroID = " & idlivro & "AND id_session= "  & idsessao
		set rssql=conexao.execute (sqlE)
		
		'VER COM O PROFESSOR  !!
	   'Dim redirectpage
		'redirectpage = Request.ServerVariables("HTTP_REFERER") 
		'If Right(redirectpage, 4) <> "?e=1" Then redirectpage = redirectpage & "?e=1"
		'Request.ServerVariables("HTTP_REFERER")
		'response.redirect(Request.redirectpage)
		
		'if session("resultadoexcluir") = true then
		'	Response.redirect("resultado.asp")
		'	session("resultadoexcluir")= false

		'end if

		'if session("autorexcluir") = true then
		'	Response.redirect("resultadoautor.asp")
		'	session("autorexcluir")= false
		'end if	
		
		'if session("categoriaexcluir") = true then
		'	Responde.redirect("resultadocategoria.asp")
		'	session("categoriaexcluir")= false			
		'end if
		
		call reservas
		'Response.Redirect ("resultado.asp")
		
	end sub
	
	sub inclusao()
		sql2= "select livroid from carrinho where livroid = " & idlivro & " AND id_session = " & idsessao
		set rssql=conexao.execute (sql2)
		
		if (not rssql.eof) then
		%>
		  <!--'response.write("Livro já inserido") -->
			
			
		<!-- <body onload="#openModal()">	-->
		
		
	
        	<h3>Livro já inserido</h3>
       
    </div>
</div>



	 
     	 <%
			call reservas
		
	else	
	sql="INSERT INTO carrinho (livroid, id_session) values (" & idlivro & ", " & idsessao & ")"
		conexao.execute(sql)
		call reservas
		
	end if
	end sub
	

	sub reservas()

		sql="select * from carrinho where id_session =" & session("session_id")
		set rsreserva = conexao.execute (sql)


		if (not rsreserva.eof) then
%>

	<p>Itens no carrinho:</p>
	<%  if Session("logado") then%>
			<% 
		sqlU = "Select * from cadastro_usuarios where usuarioID = " & session("userid")
		'response.write sqlU
		set rsU = conexao.execute(sqlU)
		%>
		
		<!-- usuario:<td> <% = rsU("nome")%> <td> <a href= "reserva.asp?acao=sair&id_sessao=<% = session("session_id") %>" > Sair </a> </td> -->
		
		<%end if%>
		<%  if Session("logadoA") then%>
			<% 
			
		sqlAD = "SELECT * FROM cadastro_admin WHERE login='" & session("login") & "' AND senha='" & session("senha") & "'"
		'response.write sqlAD
		set rsAD = conexao.execute(sqlAD)
		
		%>
		
		<!-- usuario admin:<td> <% = rsAD("login")%> <td> <a href= "reserva.asp?acao=sair&id_sessao=<% = session("session_id") %>" > Sair </a> </td> -->
	
		
		 
<%end if%>
	
		
	<table>

		<% while (not rsreserva.eof) 
		sqlL = "select * from livro where livroid =" & rsreserva("livroid")
		set rslivro = conexao.execute(sqlL)
		%>
			<tr>
            
                <td class="imgProdCarrinho">
                  <img src="imagens/capas/<% = rslivro("capas") %>" />         
               </td>
               
				<td class="td2"><% = rslivro("titulo") %></td>
				
	<td class="td3"><a href="javascript:(void)" onclick="excluir_livro(<% = session("session_id") %>,<%=rsreserva("livroid")%>)">                <img src="imagens/icon/icon-remove.png" /></a></td>
                
			</tr>
		<%
		 rsreserva.movenext
		 wend %>
		</table>
		<!--<a href ="finalizar.asp?acao=finalizar"> Confirmar reserva </a>-->
		<a class="button2" href ="confirmar.asp"> Confirmar reserva </a>

<%
	else
%>
         <p>Itens no carrinho:</p>
         <b>Sem reservas efetuadas</b>
<%
	end if

	end sub
	

%>