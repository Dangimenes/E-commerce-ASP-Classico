 <!--#Include file="topo.asp"-->  
	
<div id="content3">

<%
	
		
	
		sql="select * from carrinho where id_session =" & session("session_id")
		set rsreserva = conexao.execute (sql)
		
	
		if (not rsreserva.eof) then
			sqlD = "select data_saida , data_entrega from carrinho where id_session="& Session.SessionID
			set rsdata = conexao.execute(sqlD)
%>
	<h1>Confirmar reserva </h1>
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
		
	%>
     
			<ul>
                <li class="liTitulo"> <img src="imagens/capas/<%=rslivro("capas")%>"  /><h2> <% = rslivro("titulo") %> </h2> </li>
				<li><h2> <% = rsreserva("livroid") %> </h2></li>
				<li><h2> <% = rslivro("qtd_acervo") %> </h2></li>
				<li><h2> <% = rsBiblio("biblioteca") %> </h2></li> 
                <li><h2> <% = rsdata("data_saida") %> </h2></li> 
                <li><h2> <% = rsdata("data_entrega") %> </h2></li>
			</ul>

		 <%
		    rsreserva.movenext
		    wend 
		 %>

      </div>
      
       <div class="reservaFooter">
       </div>
       
      <a class="button" href ="finalizar.asp?<% = session("session_id") %>"> Finalizar reserva </a>
      
	<%
	end if
	%>
    
       <a class="button" href ="resultado.asp"> Escolher mais livros </a>
     
    
       

</div>
	
	<!--#Include file="footer.asp"-->