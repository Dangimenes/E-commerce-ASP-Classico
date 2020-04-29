<!--#Include file="topo.asp"-->  
   
   <!-- DIV CONTENT -->
   
   <div id="content2">  
 
 
<%
session("resultadoexcluir")=true
Dim Sql

Sql = "SELECT l.livroid, l.ativo, l.titulo, l.isbn, l.ano, l.npag, l.sinopse, l.tradutor,l.acabamento, l.formato, l.edicao, l.capas, l.qtd_acervo, c.categoria, i.idioma, b.biblioteca, a.nome, e.editora FROM (((((livro l INNER JOIN categoria c ON l.categoriaid = c.categoriaid)INNER JOIN biblioteca b ON l.bibliotecaid = b.bibliotecaid)INNER JOIN idioma i ON l.idiomaid = i.idiomaid)INNER JOIN autor a ON l.autorid = a.autorid)INNER JOIN editora e ON l.editoraid = e.editoraid) WHERE l.titulo & a.nome & c.categoria & l.isbn & l.ano & e.editora LIKE '%" & Request.Form("busca") & "%'"



   Set RsWeb = Server.CreateObject("ADODB.Recordset")
   Const numpag=8
   RsWeb.CursorLocation=3
   RsWeb.Open Sql, conexao, 3
   
   
   intCurrPage=cint(Request.QueryString("CurrPage"))

   if intCurrPage=0 then intCurrPage=1
   
   resumo = replace(rsWeb("sinopse"), "**", """")
   
%>
<%
   If RsWeb.BOF and RsWeb.EOF Then%>

      <h2 align="center">Não foram encontrados registros ! </h2>

      <br />

<%Else%>
 
 <% If Not RsWeb.BOF Then %>
   
    <div align="center">
    <h1>Resultado da Busca:</h1><br />
    
  <ul id="results">    
    
 <%
	
	  IF RsWeb.EOF then 
        Response.Write "<div align=""center"" class=""TextoNegritoCinzaEscuro"">NENHUMA COBERTURA CADASTRADA</span></div>"
	 else
	 	RsWeb.PageSize=numpag
		RsWeb.AbsolutePage=intCurrPage
     end if 

    a=0 
    i=0
     While a < numpag and Not RsWeb.EOF
    a=a+1
    i=i+1
   
    %>
        <li> 
        
        <h2><b>Titulo:</b> <%=RsWeb("titulo")%> </h2> 
        
        <div class="imgProd">
          <span> 
            <img src="imagens/capas/<%=RsWeb("capas")%>"  /> 
          </span> 
        </div>
        
        <div class="infoProd">
          <b>Autor:     </b> <%=RsWeb.Fields("nome")%>  </br>
          <b>Editora:   </b> <%=RsWeb.Fields("editora")%>  </br>
          <b>Idioma:    </b> <%=RsWeb.Fields("idioma")%>  </br>
          <b>Categoria: </b> <%=RsWeb.fields("categoria")%>  </br>
		  <b>ISBN:      </b> <%=RsWeb("isbn")%>   </br>
          <b>Publicação:</b> <%=RsWeb("ano")%>     </br>       
          <b>Formato:   </b> <%=RsWeb("formato")%>  </br>
          <b>Paginas:   </b> <%=RsWeb("npag")%>  </br>
          <b>Edição:    </b>  <%=RsWeb("edicao")%>  </br>
          <b>Biblioteca:</b> <a href="bibliotecas.asp"> <%=RsWeb.fields("biblioteca")%></a>  </br>
		  <b>Qtd Acervo:</b> <%=RsWeb("qtd_acervo")%>  </br>
        </div> 
         
         <div class="sinopse"> 
           <p><b>Sinopse:</b><%=(resumo)%></p>  </br>
         </div>
        
       <%
         if (rsweb("ativo") =1  AND rsweb("qtd_acervo")>0) then
       %>

         <a href="javascript:(void)" onclick="reserva_livro(<% = session("session_id") %>,<%=RsWeb("livroid")%>)">
         <img src="imagens/icon/reserva.gif" /> </a> 

       <%
         else
       %>

         <h3>Reserva indisponível </br> no momento</h3> 

       <% end If %>
    
        </li>
        
       <%
          RsWeb.MoveNext
          wend
	   %>   

  <% end If %>
  
   <div class="paginacaoResultado"><b>Páginas:</b>

  <% end If %>

        
        
<%
for a = 1 to RsWeb.PageCount
if a <> intCurrPage then 
Response.Write "<a class=""LinkVermelhoNegrito"" href='"&pagina&"?Currpage=" & a & "'>" & a & "</a>"
else
Response.Write "<span><b>" & a & "</b></span>"
end if
next
%>
         </div>
  
  </ul> 
  
   <%
        RsWeb.Close
        conexao.Close
     %> 

   </div>       
   </div>

 <!--#Include file="footer.asp"-->

 
</body>
</html>

