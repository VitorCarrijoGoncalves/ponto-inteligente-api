<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Form Examples | Propeller - Admin Dashboard">
<meta content="width=device-width, initial-scale=1, user-scalable=no" name="viewport">
<title>Cadastro de Usuários</title>

<jsp:include page="includes/include-formulario-head.jsp"/>

<body>

<jsp:include page="includes/include-sidebar.jsp"/>

<div id="content" class="pmd-content inner-page">

	<!--tab start-->
	<div class="container-fluid full-width-container">
	
		<!-- Title -->
		<h1 class="section-title" id="services">
			<span>Cadastro de Usuários</span>
		</h1>
			
		<ol class="breadcrumb text-left">
		  <li><a href="/home">Home</a></li>
		  <li class="active">Cadastro</li>
		</ol>
		
		<div class="section section-custom billinfo"> 
			<div class="pmd-card pmd-z-depth">
				<div class="pmd-card-body">	
					 <div class="alert alert-success" id="mensagem-sucesso">
	    				Usuário cadastrado com sucesso!
	  				</div>
	  				  <div class="alert alert-danger" id="mensagem-erro">
    					 Usuário não cadastrada!
  					</div>
					<form class="form-horizontal" role="form" method="post" action="/formulario-de-usuario/novo-cadastro">
						<div class="form-group pmd-textfield">
							<label for="inputEmail3" class="col-sm-2 control-label">Nome Completo</label>
							<div class="col-sm-10">
								<input class="form-control input-sm" name="nome" id="nome" type="text">
							</div>
						</div>
						<div class="form-group pmd-textfield">
							<label for="inputPassword3" class="col-sm-2 control-label">Nome de Usuário</label>
							<div class="col-sm-10">
								<div class="fg-line">
									<input class="form-control input-sm" name="login" id="login" type="text">
								</div>
							</div>
						</div>
						<div class="form-group pmd-textfield">
							<label for="inputEmail3" class="col-sm-2 control-label">E-mail</label>
							<div class="col-sm-10">
								<input class="form-control input-sm" name="email" id="email" type="email">
							</div>
						</div>
						<div class="form-group pmd-textfield">
							<label for="inputPassword3" class="col-sm-2 control-label">Senha</label>
							<div class="col-sm-10">
								<div class="fg-line">
									<input class="form-control input-sm" name="senha" id="senha" type="password">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary pmd-checkbox-ripple-effect">Enviar</button>
							</div>
						</div>
					</form>
				</div>
			</div> 
		</div>
	</div>
</div>

<jsp:include page="includes/include-footer.jsp"/>

<jsp:include page="includes/include-formulario-scripts.jsp"/>

</body>
</html>