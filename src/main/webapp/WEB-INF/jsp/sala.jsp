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
<title>Sala | Cinema Propeller</title>

<jsp:include page="includes/include-listagem-head.jsp"/>

<body>

<jsp:include page="includes/include-sidebar.jsp"/>

<!--content area start-->
<div id="content" class="pmd-content inner-page">

<!--tab start-->
<div class="container-fluid full-width-container data-tables">
		<!-- Title -->
		<h1 class="section-title" id="services">
			<span>Salas</span>
		</h1><!-- End Title -->
	
		<!--breadcrum start-->
		<ol class="breadcrumb text-left">
		  <li><a href="/home">Home</a></li>
		  <li class="active">Visualização</li>
		</ol><!--breadcrum end-->
	
		<!-- table card -->
		<section class="row component-section">
		
			<!-- table card title and description -->
			<div class="col-md-3">
				<div id="card">
					<h2>Descrição</h2>
				</div>
				<p>Esta é a tabela de visualização de registros já cadastrados no sistema, aonde
				posso alterar, ou deletar algum registro, caso seja necessário</p>
			</div> <!-- table card title and description end -->
			
			<!-- table card code and example -->
			<div class="col-md-9">
				<div class="component-box">
					<!-- table card example -->
					<div  class="pmd-card pmd-z-depth pmd-card-custom-view">
						<div class="table-responsive">
						<table id="example-checkbox" class="table pmd-table table-hover table-striped display responsive nowrap" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th></th>
								<th>NÚMERO</th>
								<th>QTDE. DE LUGARES</th>
								<th>SEÇÕES</th>
							</tr>
						</thead>
						<tbody>
							
						<c:forEach var="sala" items="${salas}">
							<tr id="tr_${sala.id }">
								<td><input type="hidden" id="idSala" name="idSala" value="${sala.id }"></td>
								<td id="numero">${ sala.numero }</td>
								<td id="quantidadeDeLugares">${ sala.quantidadeDeLugares }</td>
								<td><a href="/sala/secoes" id="listagem-de-secoes"><i class="material-icons md-dark pmd-sm">personal_video</i></a></td>
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

<div tabindex="-1" class="modal fade" id="form-dialog" style="display: none;" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bordered">
				<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
				<h2 class="pmd-card-title-text">Alterar Sala</h2>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group pmd-textfield pmd-textfield">
						<label for="first-name">Número</label>
						<input type="hidden" id="idSalaModal" name="idSalaModal">
						<input type="text" class="mat-input form-control" id="numeroModal" name="numeroModal">
					</div>
					<div class="form-group pmd-textfield pmd-textfield">
						<label for="first-name">Quantidade de Lugares</label>
						<input type="text" class="mat-input form-control" id="quantidadeDeLugaresModal" name="quantidadeDeLugaresModal">
					</div>
				</form>
			</div>
			<div class="pmd-modal-action">
				<button data-dismiss="modal"  class="btn pmd-ripple-effect btn-primary" type="submit" id="btn-update">Salvar Alterações</button>
			</div>
		</div>
	</div>
</div>

<jsp:include page="includes/include-footer.jsp"/>
<jsp:include page="includes/include-listagem-scripts.jsp"/>

<script>


$(document).ready(function() {
	
	$("#btn-delete").click(function(e) {
		e.preventDefault();

		var idSala = $("#idSala").val();

		if (confirm("Deseja excluir?")) {
			console.log(idSala);

			$.ajax({
				url : window.location + "/delete/" + idSala,
				type : "DELETE",
				success : function() {
					$('#tr_' + idSala).remove();
				},
				error : function(data) {

				}
			});

		} else {

		}

	});

	$("#open_modal").click(function(e) {
		e.preventDefault();
		$("#idSalaModal").val($("#idSala").val());
		$("#numeroModal").val($("#numero").text());
		$("#quantidadeDeLugaresModal").val($("#quantidadeDeLugares").text());
	});

	$("#btn-update").click(function(e) {

		var sala = {
				id : $("#idSalaModal").val(),
				numero : $("#numeroModal").val(),
				quantidadeDeLugares : $("#quantidadeDeLugaresModal").val()
			};
	
		
		console.log(sala);
		
		$.ajax({
			method : "PUT",
			contentType : 'application/json',
			url : "/sala/update/" + $("#idSalaModal").val(),
			dataType : "json",
			data : JSON.stringify(sala),
			success : function(sala) {
				var objSala = new Object();
				objSala = JSON.parse(sala);

				//limpar a tela
				$("#idSalaModal").val("");
				$("#numeroModal").val("");
				$("#quantidadeDeLugaresModal").val("");
				console.log("Objeto sala depois do sucesso: ", objSala);
			},
			error : function(errResponse) {
				console.log("error", errResponse);
			}
		});
		
		
	});

	$('#listagem-de-secoes').click(function () {
		
		$.ajax({
			method : "GET",
			contentType : 'application/json',
			url : "/sala/secoes/" + $("#idSala").val(),
			dataType : "json",
			success : function() {
				
			},
			error : function(errResponse) {
				console.log("error", errResponse);
			}
		});
		
	});

});

</script>

</body>
</html>