<!-- #include file="conexao.inc" -->
<%  
  Set conexao = Server.CreateObject("ADODB.Connection")
   conexao.open="Provider=Microsoft.ACE.OLEDB.12.0;Data Source="& Server.MapPath("buscateca.accdb")

  dim conexao, SQL_update, rs_up, id, biblioteca, titulo, autor, editora, isbn, idioma, categoria, publicacao, tradutor, edicao, formato, pags, resumo, capa

  id=Request.form("id_livro")
  biblioteca=Request.form("biblioteca")
  titulo=Request.form("txttitulo")
  autor=Request.form("autor")
  editora=Request.form("editora")
  isbn=Request.form("txtISBN")
  idioma=Request.form("idioma")
  categoria=Request.form("categoria")
  publicacao=Request.form("txtPubli")
  tradutor=Request.form("txtTrad")
  edicao=Request.form("txtEdicao")
  formato=Request.form("txtFormato")
  pags=Request.form("txtPag")
  resumo=Request.form("txtSinopse")
  resumo = replace(resumo, "'", "**")
  capa=Request.form("txtCapas")  
  acervo=Request.form("txtQtd")
  
  SQL_update="update livro set titulo='" & titulo & "',autorid=" & autor & ",isbn='" & isbn & "',bibliotecaid=" & biblioteca & ",editoraid=" & editora & ",idiomaid=" & idioma & ",categoriaid= " & categoria & ",ano='" & publicacao & "',tradutor='" & tradutor & "',edicao='" & edicao & "',formato='" & formato & "',npag='" & pags & "',sinopse='" & resumo & "',capas='" & capa & "',qtd_acervo='" & acervo & "' where livroid="&id 
 
   response.write SQL_update   
   
   conexao.execute(SQL_update)
   conexao.close
   
   response.redirect "selecao_livro.asp"
   
  
%>