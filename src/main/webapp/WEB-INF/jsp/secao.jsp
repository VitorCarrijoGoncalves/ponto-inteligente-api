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
<title>Seção | Cinema Propeller</title>

<jsp:include page="includes/include-listagem-head.jsp"/>

<body>

<jsp:include page="includes/include-sidebar.jsp"/>

<!--content area start-->
<div id="content" class="pmd-content inner-page">

<!--tab start-->
<div class="container-fluid full-width-container data-tables">
		<!-- Title -->
		<h1 class="section-title" id="services">
			<span>Seções</span>
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
								<th>Data</th>
								<th>Hora</th>
								<th>Valor</th>
								<th>Filme</th>
								<th>Sala</th>
								<th>Ingressos</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach var="secao" items="${secoes}">
						<tr id="tr_${secao.id }">
							<td>
								<input type="hidden" id="idSecao" name="idSecao" value="${secao.id }">
								<input type="hidden" id="idFilme" name="idFilme" value="${secao.idFilme }">
								<input type="hidden" id="idSala" name="idSala" value="${secao.idSala }">
							</td>
							<td id="data" >${ secao.data }</td>
							<td id="hora">${secao.hora }</td>
							<td id="valorDoIngresso">${ secao.valorDoIngresso }</td>
							<td id="filme">${ secao.idFilme.nome }</td>
							<td id="sala">${ secao.idSala.numero }</td>
							<td><a href="/secao/ingressos" id="listagem-de-ingressos"><i class="material-icons md-dark pmd-sm">format_list_bulleted</i></a></td>
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
				<h2 class="pmd-card-title-text">Alterar Seção</h2>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group pmd-textfield pmd-textfield">
						<label for="first-name">Filme</label>
<!-- 						<input type="hidden" id="idSecaoModal" name="idSecaoModal"> -->
						<select class="select-simple form-control pmd-select2" id="idFilmeModal" name="idFilmeModal">
							<option></option>
							<option>aaaa</option>
						</select>
					</div>
					<div class="form-group pmd-textfield pmd-textfield">
						<label for="first-name">Sala</label>
						<select class="select-simple form-control pmd-select2" id="idSalaModal" name="idSalaModal">
							<option></option>
							<option>aaaa</option>
						</select>
					</div>
					<div class="form-group pmd-textfield pmd-textfield">
						<label for="first-name">Data</label>
						<input type="date" class="form-control" id="dataModal" name="dataModal" />
					</div>
					<div class="form-group pmd-textfield pmd-textfield">
						<label for="first-name">Hora</label>
						<input type="time" class="form-control" id="horaModal" name="horaModal" />
					</div>
					<div class="form-group pmd-textfield pmd-textfield">
						<label for="first-name">Valor do Ingresso</label>
						<input type="text" class="mat-input form-control" id="valorDoIngressoModal" name="valorDoIngressoModal">
					</div>
				</form>
			</div>
			<div class="pmd-modal-action">
				<button data-dismiss="modal"  class="btn pmd-ripple-effect btn-primary" type="submit">Salvar Alterações</button>
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

				var idSecao = $("#idSecao").val();

				if (confirm("Deseja excluir?")) {
					console.log(idSecao);

					$.ajax({
						url : window.location + "/delete/" + idSecao,
						type : "DELETE",
						success : function() {
							$('#tr_' + idSecao).remove();
						},
						error : function(data) {

						}
					});

				} else {

				}

			});

			$("#open_modal").click(function(e) {
				e.preventDefault();
				$("#idSecaoModal").val($("#idSecao").val());
				$("#dataModal").val($("#data").text());
				$("#horaModal").val($("#hora").text());
				$("#valorDoIngressoModal").val($("#valorDoIngresso").text());
				$("#idSalaModal").val($("#idSala").text());
				$("#idFilmeModal").val($("#idFilme").text());
			});

			$("#btn-update").click(function(e) {

				var secao = {
					id : $("#idSecaoModal").val(),
					data : $("#dataModal").val(),
					hora : $("#horaModal").val(),
					ingresso : $("#valorDoIngressoModal").val(),
					sala : $("#idSalaModal").val(),
					filme : $("#idFilmeModal").val()
				};
				
				console.log(secao);
				
				$.ajax({
					method : "PUT",
					contentType : 'application/json',
					url : "/secao/update/" + $("#idSecaoModal").val(),
					dataType : "json",
					data : JSON.stringify(secao),
					success : function(secao) {
						var objSecao = new Object();
						objSecao = JSON.parse(secao);

						//limpar a tela
						$("#idSecaoModal").val("");
						$("#dataModal").val("");
						$("#horaModal").val("");
						$("#valorDoIngressoModal").val("");
						$("#idSalaModal").val("");
						$("#idFilmeModal").val("");
						console.log("Objeto seção depois do sucesso: ", objSecao);
					},
					error : function(errResponse) {
						console.log("error", errResponse);
					}
				});
			});

			$('#listagem-de-ingressos').click(function () {
				
				$.ajax({
					method : "GET",
					contentType : 'application/json',
					url : "/secao/ingressos/" + $("#idSecao").val(),
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