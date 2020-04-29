<!--#Include file="topoadm.asp"-->  
<%
If NOT Session("logadoA") = true Then
Response.redirect("login_adm.asp")
Response.End
End If  
%>
<h1 style=" text-align:center; letter-spacing: -1px; color: #F66; font:bold 24px/28px Open Sans; ">Histórico de Reservas</h1>
<div class="reserva">
             <ul>
				
				<li class="liTitulo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Titulo do Livros</li>
				<li>ID do Livro</li>
				<li>Autor</li>
				<li>ISBN</li>
				<li>Biblioteca</li>
                <li>Data de Saida</li>
                <li>Data de Devolucao</li> 
			</ul>
            
     </div>
     
     <div class="reservaContent">
     
     <% 
	 	
	 
	
		'sqlU = "select * from cadastro_usuarios"
		'	set rsU = conexao.execute(sqlU)
		
			sqlC = "select * from carrinho where data_saida IS NOT NULL and data_entrega IS NOT NULL order by 1 desc" ' where usuarioID ="& rsU("usuarioID")
		'response.write sqlC
		set rsC = conexao.execute(sqlC)
		

			
		
		while (not rsC.eof) 
		
			sqlU = "select * from cadastro_usuarios where usuarioid =" & rsC("usuarioid") 
	set rsU = conexao.execute(sqlU)
		
		sqlL = "select * from livro where livroid =" & rsC("livroid")
		set rslivro = conexao.execute(sqlL)
		
		SQLB = "select * from biblioteca where bibliotecaID = " & rslivro("bibliotecaID")
		set rsBiblio = conexao.execute(sqlB)
		
		sqlA = "select * from autor where autorid = " & rslivro("autorid")
		set rsAutor = conexao.execute(sqlA)
		
	%>
     
			<ul> 
		
			<li><h2> <% = rsU("nome")%>  </h2></li></ul> 
			<ul>
				<li class="liTitulo"> <img src="imagens/capas/<%=rslivro("capas")%>"  /><h2> <% = rslivro("titulo") %> </h2> </li>
				<li><h2> <% = rsC("livroid") %> </h2></li>
				<li><h2> <% = rsAutor("nome") %> </h2></li>
				<li><h2> <% = rslivro("isbn") %> </h2></li>
				<li><h2> <% = rsBiblio("biblioteca") %> </h2></li> 
                <li><h2> <% = rsC("data_saida") %> </h2></li> 
                <li><h2> <% = rsC("data_entrega") %> </h2></li>
			</ul>

		 <%
		    rsC.movenext
			
		    wend 
			rsC.close 
			rsAutor.close 
			rsLivro.close 
			rsBiblio.close 
			
		 %>
		 </br></br>
		</div>


	<!--#Include file="footer.asp"-->