<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"
	content="Data Table | Propeller - Admin Dashboard">
<meta content="width=device-width, initial-scale=1, user-scalable=no"
	name="viewport">
<title>Filme | Cinema Propeller</title>

<jsp:include page="includes/include-listagem-head.jsp" />
<body>

	<jsp:include page="includes/include-sidebar.jsp" />

	<!--content area start-->
	<div id="content" class="pmd-content inner-page">

		<!--tab start-->
		<div class="container-fluid full-width-container data-tables">
			<!-- Title -->
			<h1 class="section-title" id="services">
				<span>Filmes</span>
			</h1>
			<!-- End Title -->

			<!--breadcrum start-->
			<ol class="breadcrumb text-left">
				<li><a href="/home">Home</a></li>
				<li class="active">Visualização</li>
			</ol>
			<!--breadcrum end-->

			<!-- table card -->
			<section class="row component-section">

				<!-- table card title and description -->
				<div class="col-md-3">
					<div id="card">
						<h2>Descrição</h2>
					</div>
					<p>Esta é a tabela de visualização de registros já cadastrados
						no sistema, aonde posso alterar, ou deletar algum registro, caso
						seja necessário</p>
				</div>
				<!-- table card title and description end -->

				<!-- table card code and example -->
				<div class="col-md-9">
					<div class="component-box">
						<div class="pmd-card pmd-z-depth pmd-card-custom-view">
							<div class="table-responsive">
								<table id="example-checkbox" class="table pmd-table table-hover table-striped display responsive nowrap"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th></th>
											<th>NOME</th>
											<th>GÊNERO</th>
											<th>SINOPSE</th>
											<th>DURAÇÃO</th>
											<th>STATUS</th>
											<th>SEÇÕES</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="filme" items="${filmes}">
											<tr id="tr_${filme.id }">
												<td><input type="hidden" id="idFilme" name="idFilme" value="${filme.id }"></td>
												<td id="td_nome">${ filme.nome }</td>
												<td id="td_genero">${ filme.genero }</td>
												<td id="td_sinopse">S<input type="hidden" value="${filme.sinopse }"></td>
												<td id="td_duracao">${ filme.duracao }</td>
												<c:if test="${filme.status } == TRUE">
													<td id="td_status">Filme em Lançamento</td>
												</c:if>
												<td id="td_status">Filme fora de Lançamento</td>
												<td><a href="/filme/secoes" id="listagem-de-secoes"><i class="material-icons md-dark pmd-sm">personal_video</i></a></td>
											</tr>

										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
						<!-- table card example end -->
					</div>
				</div>
				<!-- table card code and example end -->
			</section>
			<!-- table card end -->
		</div>

	</div>

	<div tabindex="-1" class="modal fade" id="form-dialog"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bordered">
					<button aria-hidden="true" data-dismiss="modal" class="close"
						type="button">×</button>
					<h2 class="pmd-card-title-text">Alterar Filme</h2>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group pmd-textfield pmd-textfield">
							<label for="first-name">Nome</label> <input type="hidden"
								id="idFilmeModal" name="idFilmeModal"> <input
								type="text" class="mat-input form-control" id="nomeModal"
								name="nomeModal">
						</div>
						<div class="form-group pmd-textfield pmd-textfield">
							<label for="first-name">Gênero</label> <input type="text" class="mat-input form-control" id="generoModal" name="generoModal">
						</div>
						<div class="form-group pmd-textfield pmd-textfield">
							<label for="first-name">Duração</label> <input type="text" class="mat-input form-control" id="duracaoModal" name="duracaoModal">
						</div>
						<div class="form-group pmd-textfield pmd-textfield">
							<label for="first-name">Status</label> 
							<select class="select-simple form-control pmd-select2" id="statusModal" name="statusModal">
								<option value="TRUE">Lançamento</option>
								<option value="FALSE">Não-Lançamento</option>
							</select>
						</div>
						<div class="form-group pmd-textfield pmd-textfield">
							<label class="control-label">Sinopse</label>
							<textarea required class="form-control" id="sinopseModal" name="sinopseModal"></textarea>
						</div>
					</form>
				</div>
				<div class="pmd-modal-action">
					<button id="btn-update" class="btn pmd-ripple-effect btn-primary" type="submit">Salvar Alterações</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="includes/include-footer.jsp" />
	<jsp:include page="includes/include-listagem-scripts.jsp" />

	<script>
		$(document).ready(function() {

			$("#btn-delete").click(function(e) {
				e.preventDefault();

				var idFilme = $("#idFilme").val();

				if (confirm("Deseja excluir?")) {
					console.log(idFilme);

					$.ajax({
						url : window.location + "/delete/" + idFilme,
						type : "DELETE",
						success : function() {
							$('#tr_' + idFilme).remove();
						},
						error : function(data) {

						}
					});

				} else {

				}

			});

			$("#open_modal").click(function(e) {
				e.preventDefault();
				$("#idFilmeModal").val($("#idFilme").val());
				$("#nomeModal").val($("#td_nome").text());
				$("#generoModal").val($("#td_genero").text());
				$("#duracaoModal").val($("#td_duracao").text());
				$("#statusModal").val($("#td_status").text());
				$("#sinopseModal").val($("#td_sinopse").text());
			});

			$("#btn-update").click(function(e) {

				var filme = {
					id : $("#idFilmeModal").val(),
					nome : $("#nomeModal").val(),
					genero : $("#generoModal").val(),
					duracao : $("#duracaoModal").val(),
					status : $("#statusModal").val(),
					sinopse : $("#sinopseModal").val()
				};
				
				console.log(filme);
				
				$.ajax({
					method : "PUT",
					contentType : 'application/json',
					url : "/filme/update/" + $("#idFilmeModal").val(),
					dataType : "json",
					data : JSON.stringify(filme),
					success : function(filme) {
						var objFilme = new Object();
						objFilme = JSON.parse(filme);

						//limpar a tela
						$("#idFilmeModal").val("");
						$("#nomeModal").val("");
						$("#generoModal").val("");
						$("#duracaoModal").val("");
						$("#statusModal").val("");
						$("#sinopseModal").val("");
						console.log("Objeto filme depois do sucesso: ", objFilme);
					},
					error : function(errResponse) {
						console.log("error", errResponse);
					}
				});
			});

// 			$('#open_modal').click(function () {
				
// 				$.ajax({
// 					method : "GET",
// 					contentType : 'application/json',
// 					url : "/filme/get-sinopse/" + $("#idFilme").val(),
// 					dataType : "json",
// 					success : function() {
// 						var sinopse = JSON.parse(response);
// 						$("#sinopseModal").val(sinopse);
// 					},
// 					error : function(errResponse) {
// 						console.log("error", errResponse);
// 					}
// 				});
				
// 			});

			$('#listagem-de-secoes').click(function () {
				
				$.ajax({
					method : "GET",
					contentType : 'application/json',
					url : "/filme/secoes/" + $("#idFilme").val(),
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