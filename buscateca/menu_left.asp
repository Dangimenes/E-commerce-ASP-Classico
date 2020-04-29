   <div id="menu2">
	    
		<%
	   sqlC="select * from carrinho where id_session =" & session("session_id") & "AND confirma_reserva = false " 
		set rsreserva = conexao.execute(sqlC)
		
		
		%>
		
		<div id="carrinho">
		<p>Itens no carrinho:</p>
<%  if Session("logado") = true then%>
			<% 
		sqlU = "Select * from cadastro_usuarios where usuarioID = " & session("userid")
		'response.write sqlU
		set rsU = conexao.execute(sqlU)
		
		%>
		
	<!-- usuario:<td> <% = rsU("nome")%> <td> <a href= "reserva.asp?acao=sair&id_sessao=<% = session("session_id") %>" > Sair </a>        </td> -->
	
		
		 
<%end if%>
<%  if Session("logadoA") then%>
			<% 
			
		sqlAD = "SELECT * FROM cadastro_admin WHERE login='" & session("login") & "' AND senha='" & session("senha") & "'"
		'response.write sqlAD
		set rsAD = conexao.execute(sqlAD)
		
		%>
		
		<!-- usuario admin:<td> <% = rsAD("login")%> <td> <a href= "reserva.asp?acao=sair&id_sessao=<% = session("session_id") %>" > Sair </a> </td> -->
	
		
		 
<%end if%>
		<% if(not rsreserva.eof)  then %>
		<table>
		<%
		while (not rsreserva.eof) 
		
			sqlL = "select * from livro where livroid =" & rsreserva("livroid")
			set rslivro = conexao.execute(sqlL)
		
		%>
		
			<tr>
				        
               <td class="imgProdCarrinho">
                  <img src="imagens/capas/<% = rslivro("capas") %>" />         
               </td>
              
			
				<td class="td2"> <% = rslivro("titulo") %></td>
				
	<td class="td3"><a href="javascript:(void)" onclick="excluir_livro(<% = session("session_id") %>,<%=rsreserva("livroid")%>)">                <img src="imagens/icon/icon-remove.png" /></a></td>
				
			</tr>
			
		<%
		 rsreserva.movenext
		 wend %>
		 </table>
			<!--<a href ="finalizar.asp?acao=finalizar"> Finalizar reserva </a> -->
				<a class="button2" href ="confirmar.asp"> Confirmar reserva </a>
		 <%else %>
		
			
				<b>Sem reservas efetuadas</b>
			
		
	<% end if %>
	
		</div>
	</div>