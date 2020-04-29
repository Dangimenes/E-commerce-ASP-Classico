<div id="main2">
	<div id="header">
		<div id="menu">
			<ul>
				<li><a href="login.asp">Login</a></li>  
				<li><a href="categoria.asp">Categorias</a></li>
				<li><a href="autores.asp">Autores</a></li>
				<li><a href="bibliotecas.asp">Bibliotecas</a></li>  
				<li><a href="index.asp">Home</a></li>
			</ul>
		</div>
	</div>  
   <div id="banner2">
		<img src="imagens/Buscateca-logo2.gif">
		<form name="busca" method="post"  action="resultado.asp">
			<input name="busca" type="text" size="35" id="BuscaInput" />
			<input type="submit" name="Submit" id="Buscar"  value="Buscar" />
		</form> 
	<div id="menu2">
	    
		<%
	   sqlC="select * from carrinho where id_session =" & session("session_id")
		set rsreserva = conexao.execute(sqlC)
		%>
		
		<div id="carrinho">
		<table border="1">
		<% if(not rsreserva.eof)  then
		
		while (not rsreserva.eof) %>
			<tr>
				<td><% = rsreserva("livroid") %></td>
			</tr>
		<%
		 rsreserva.movenext
		 wend
		 else
		%>
			<tr>
				<td>Sem reservas efetuadas</td>
			</tr>
	<% end if %>
	</table>
		</div>
	</div>
</div>
  
   
  
   
   