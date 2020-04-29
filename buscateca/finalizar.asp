 <!--#Include file="topo.asp"-->  
	<%
	 if (Session("logado")) then
	session("finalizar")=true
	acao = Request.querystring("acao")
	
	
		data=date()
		dataentrega=date()+15
		sqlF = "UPDATE carrinho SET  confirma_reserva = true, usuarioid="&session("userid")&  ", data_saida ='" & data &  "', data_entrega ='" & dataentrega & "' WHERE id_session="& Session.SessionID
		'sqlF2 = "UPDATE carrinho SET usuarioid = "
		set rssqlF=conexao.execute(sqlF)
		
	
		sql="select * from carrinho where id_session =" & session("session_id")
		set rsreserva = conexao.execute (sql)
		
		

		if (not rsreserva.eof) then
			sqlD = "select data_saida , data_entrega from carrinho where id_session="& Session.SessionID
			set rsdata = conexao.execute(sqlD)
%>
	
    <h1 style=" text-align:center; letter-spacing: -1px; color: #F66; font:bold 24px/28px Open Sans;  ">Reserva Finalizada</h1>
	<div class="reserva">
    
             <ul>
				<li class="liTitulo">Titulo do Livros</li>
				<li>ID Reserva</li>
				<li>Quantidade acervo</li>
				<li>Biblioteca</li>
                <li>Dara de Saida</li>
                <li>Data de Devolucao</li> 
			</ul>
            
     </div>
     
    <div class="reservaContent">
			
	<% 
	    
		sqlD = "select data_saida , data_entrega from carrinho where id_session="& Session.SessionID
		while (not rsreserva.eof) 
		sqlL = "select * from livro where livroid =" & rsreserva("livroid")
		set rslivro = conexao.execute(sqlL)
		SQLB = "select * from biblioteca where bibliotecaID = " & rslivro("bibliotecaID")
		set rsBiblio = conexao.execute(sqlB)
		
		
		sqlQ = "UPDATE livro SET qtd_acervo = qtd_acervo - 1 WHERE livroID = " & rsreserva("livroid")
		set rsQuant = conexao.execute (sqlQ)
		
	%>
			
            <ul>
				<li class="liTitulo"><img src="imagens/capas/<%=rslivro("capas")%>"  /><h2> <h2><% = rslivro("titulo") %></h2> </h2></li>
				<li><h2> <% = rsreserva("livroid") %> </h2></li>
				<li><h2><% = rslivro("qtd_acervo") %></h2></li>
				<li><a href ="bibliotecas.asp" target="_blank"><h2> <% = rsBiblio("biblioteca") %> </h2></a></li> 
		        <li><h2><% = rsdata("data_saida") %></h2></li> 
		        <li><h2><% = rsdata("data_entrega") %></h2></li>
            </ul>
		
		<%
		   rsreserva.movenext
		   wend 
		%>
        
     <div class="reservaFooter">
     </div>
		 
	</div>

		
	<%
	sessaoid = request.querystring("id_sessao")
    'Método para finalizar a sessão	imediatamente		 
    Session.Abandon

	
	end if
    else
		session("pagefinalizar")=true
		response.redirect "login_user.asp"
	end if
	
	%>

	
	<!--#Include file="footer.asp"-->