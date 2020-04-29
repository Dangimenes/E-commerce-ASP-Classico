<!-- #include file="conexao.inc" -->
<%  
  Set conexao = Server.CreateObject("ADODB.Connection")
   conexao.open="Provider=Microsoft.ACE.OLEDB.12.0;Data Source="& Server.MapPath("buscateca.accdb")

  dim conexao, SQL_update, rs_up, id, nome, login, senha, rg, email, cep, cidade, fone, endereco

  id=Request.form("id_user")
  nome=Request.form("txtNome")
  login=Request.form("txtLogin")
  senha=Request.form("txtSenha")
  rg=Request.form("txtRG")
  email=Request.form("txtEmail")
  cep=Request.form("txtCep")
  cidade=Request.form("txtCid")
  fone=Request.form("txtFone")
  endereco=Request.form("txtEnd")  
  
  
  SQL_update="update cadastro_usuarios set nome='" & nome & "',login='" & login & "',senha='" & senha & "',rg='" & rg & "',email='" & email & "',cep='" & cep & "',cidade='"& cidade &"',fone='" & fone & "',endereco='" & endereco & "'  where usuarioId="&id 
 
   response.write SQL_update   
   
   conexao.execute(SQL_update)
   conexao.close
   
   response.redirect "index.asp"
   
  
%>