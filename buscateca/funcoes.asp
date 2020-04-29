<!-- #include file="conexao.inc" -->
<% 
  acao=Request.QueryString("acao")
  
  Select Case acao
  Case "incluirautor"
	Call incluirautor
  Case "incluireditora"
	Call incluireditora
  Case "incluiridioma"
    Call incluiridioma
  Case "incluircategoria"
    Call incluircategoria  
  Case "incluirbiblioteca"
	Call incluirbiblioteca 
	end Select

'--------------- inclusao autores ---------------

  sub incluirautor
  
     autor=Request.form("txtAutor")
	 
	 sql="Insert into autor(nome) values('"& autor &"')"
	 
	 conexao.execute(sql)
	 conexao.close
	 response.redirect "admin.asp"
	 
  end sub	 
  
'--------------- inclusao editora ---------------

  sub incluireditora
  
     editora=Request.form("txtEditora")
	 
	 sql="Insert into editora(editora) values('"& editora &"')"
	 
	 conexao.execute(sql)
	 conexao.close
	 response.redirect "admin.asp"
	 
  end sub	   
  
'--------------- inclusao idioma ---------------

  sub incluiridioma
  
     idioma=Request.form("txtIdioma")
	 
	 sql="Insert into idioma(idioma) values('"& idioma &"')"
	 
	 conexao.execute(sql)
	 conexao.close
	 response.redirect "admin.asp"
	 
  end sub	

'--------------- inclusao categoria ---------------

  sub incluircategoria
  
     categoria=Request.form("txtCategoria")
	 
	 sql="Insert into categoria(categoria) values('"& categoria &"')"
	 
	 conexao.execute(sql)
	 conexao.close
	 response.redirect "admin.asp"
	 
  end sub	

  
  
'--------------- inclusao biblioteca ---------------

  sub incluirbiblioteca

	bibli=Request.form("txtBibli")
	endereco=Request.form("txtEnd")
	numero=Request.form("txtNum")
	bairro=Request.form("txtBairro")
	cep=Request.form("txtCep1") &"-"& Request.form("Cep2")
	fone=Request.form("txtDDD") &"-"& Request.form("txtFone")
	cidade=Request.form("txtCidade")
	foto=Request.form("txtFoto")
	mapa=Request.form("txtMapa")
	
	sql="Insert into biblioteca(biblioteca,endereco,numero,bairro,cep,fone,cidade,fotobiblio,mapa) values('"& bibli &"','"& endereco &"','"& numero &"','"& bairro &"','"& cep &"','"& fone &"','"& cidade &"','"& foto &"','"& mapa &"')"
	
	response.write sql

	conexao.execute(sql)
	conexao.close
	response.redirect "admin.asp"
	
  end sub  
  
  
%>