<!--#Include file="conexao.inc"-->

<%

inativar = Request.form("inativar")
ID = Request.form("IdHidden")

DIM SQL

SQL = "UPDATE livro SET ativo = 0 WHERE livroid = "+Request.QueryString+" "
conexao.execute(SQL)


response.redirect ("excluir_livros_admin.asp")   

%>



