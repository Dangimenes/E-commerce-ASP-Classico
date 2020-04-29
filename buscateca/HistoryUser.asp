<!--#Include file="topo.asp"-->  
<%If NOT Session("logado") = true Then
Session("history") = true
Response.redirect("login_user.asp")
Response.End
End If  
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<h1 style=" text-align:center; letter-spacing: -1px; color: #F66; font:bold 24px/28px Open Sans; ">Historico de Reservas</h1>
<div class="reserva">
    
             <ul>
				<li class="liTitulo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Titulo do Livros</li>
				<li>Autor</li>
				<li>ISBN</li>
				<li>Biblioteca</li>
                <li>Data de Saida</li>
                <li>Data de Devolucao</li> 
			</ul>
            
     </div>
     
     <div class="reservaContent">
     
     <% 
		sqlC = "select * from carrinho where usuarioID ="& session("userid") & " order by 1 desc"
		'response.write sqlC
		set rsC = conexao.execute(sqlC)
	
		
		while (not rsC.eof) 
		
		sqlL = "select * from livro where livroid =" & rsC("livroid")
		set rslivro = conexao.execute(sqlL)
		
		SQLB = "select * from biblioteca where bibliotecaID = " & rslivro("bibliotecaID")
		set rsBiblio = conexao.execute(sqlB)
		
		sqlA = "select * from autor where autorid = " & rslivro("autorid")
		set rsAutor = conexao.execute(sqlA)
	%>
     
			<ul>
                <li class="liTitulo"> <img src="imagens/capas/<%=rslivro("capas")%>"  /><h2> <% = rslivro("titulo") %> </h2> </li>
				<li><h2> <% = rsAutor("nome") %> </h2></li>
				<li><h2> <% = rslivro("isbn") %> </h2></li>
				<li><h2> <% = rsBiblio("biblioteca") %> </h2></li> 
                <li><h2> <% = rsC("data_saida") %> </h2></li> 
                <li><h2> <% = rsC("data_entrega") %> </h2></li>
			</ul>

		 <%
		    rsC.movenext
		    wend 
		 %>
		 </br></br>
		 </div>

	<!--#Include file="footer.asp"-->