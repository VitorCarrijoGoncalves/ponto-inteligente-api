<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Data Table | Propeller - Admin Dashboard">
<meta content="width=device-width, initial-scale=1, user-scalable=no" name="viewport">
<title>Listagem de Seções Por Sala | Cinema Propeller</title>

<jsp:include page="includes/include-listagem-head.jsp"/>

<body>

<jsp:include page="includes/include-sidebar.jsp"/>

<!--content area start-->
<div id="content" class="pmd-content inner-page">

<!--tab start-->
<div class="container-fluid full-width-container data-tables">
		<!-- Title -->
		<h1 class="section-title" id="services">
			<span>Listagem de Seções por Sala</span>
		</h1><!-- End Title -->
	
		<!--breadcrum start-->
		<ol class="breadcrumb text-left">
		  <li><a href="/home">Home</a></li>
		  <li><a href="/sala">Visualização</a></li>
		  <li class="active">Seções</li>
		</ol><!--breadcrum end-->
	
		<section class="row component-section">
			<div class="col-md-3">
				<div id="card">
					<h2>Descrição</h2>
				</div>
				<p>Esta é a tabela de visualização de registros já cadastrados no sistema, aonde
				posso alterar, ou deletar algum registro, caso seja necessário</p>
			</div> <!-- table card title and description end -->
			
			<div class="col-md-9">
				<div class="component-box">
					<div  class="pmd-card pmd-z-depth pmd-card-custom-view">
						<div class="table-responsive">
						<table id="example-checkbox" class="table pmd-table table-hover table-striped display responsive nowrap" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th></th>
									<th>FILME</th>
									<th>INGRESSO</th>
									<th>DATA</th>
								</tr>
							</thead>
						<tbody>
						
					<c:forEach var="secao" items="${secoes}">
						<tr>
							<td></td>
							<td id="filme">${secao.idFilme.nome }</td>
							<td id="ingresso">${ secao.valorDoIngresso }</td>
							<td id="data">${ secao.dataHora }</td>
						</tr>
				</c:forEach>
						
						</tbody>
					</table>
						</div>
					</div> <!-- table card example end -->
				</div>
			</div> <!-- table card code and example end -->
		</section> <!-- table card end -->
	</div>

</div>

<jsp:include page="includes/include-footer.jsp"/>
<jsp:include page="includes/include-listagem-scripts.jsp"/>

</body>
</html>