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
<title>Cadastro de Filmes</title>

<jsp:include page="includes/include-formulario-head.jsp"/>

<body>

<jsp:include page="includes/include-sidebar.jsp"/>

<!--content area start-->
<div id="content" class="pmd-content inner-page">

	<div class="container-fluid full-width-container">
	
		<h1 class="section-title" id="services">
			<span>Cadastro de Filmes</span>
		</h1><!-- End Title -->
			
		<!--breadcrum start-->
		<ol class="breadcrumb text-left">
		  <li><a href="/home">Home</a></li>
		  <li class="active">Cadastro</li>
		</ol><!--breadcrum end-->
	
		<div class="section section-custom billinfo"> 
			<form id="validationForm" action="/formulario-de-filme/novo-cadastro" method="post" enctype="multipart/form-data">
			<div class="pmd-card pmd-z-depth">
				<div class="pmd-card-body">
					<div class="group-fields clearfix row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="form-group pmd-textfield pmd-textfield-floating-label">
								<label for="regular1" class="control-label">
									Nome
								</label>
								<input type="text" id="nome" name="nome" class="form-control">
							</div>
						</div>
					</div>
					<div class="group-fields clearfix row">
						<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
							<div class="form-group pmd-textfield pmd-textfield-floating-label">       
								<label>Gênero</label>
								<input type="text" id="genero" name="genero" class="form-control">
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<div class="form-group pmd-textfield pmd-textfield-floating-label">       
								<label>Duração</label>
								<input type="time" id="duracao" name="duracao" class="form-control">
							</div>
						</div>
					</div>
					<div class="group-fields clearfix row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="form-group pmd-textfield pmd-textfield-floating-label">
							  <label class="control-label">Sinopse</label>
							  <textarea required class="form-control" id="sinopse" name="sinopse"></textarea>
							</div>
						</div>
					</div>
					<div class="group-fields clearfix row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="form-group pmd-textfield pmd-textfield-floating-label">
							  <input type="file" class="form-control" id="capaDoFilme" name="capaDoFilme">
							</div>
						</div>
					</div>
				</div>		
				<div class="pmd-card-actions">
					<button type="submit" class="btn btn-primary next">Enviar</button>
				</div>
			</div> 
			</form>
		</div>
	</div>
</div>

<jsp:include page="includes/include-footer.jsp"/>

<jsp:include page="includes/include-formulario-scripts.jsp"/>
<jsp:include page="includes/include-datepicker-scripts.jsp"/>

</body>
</html>