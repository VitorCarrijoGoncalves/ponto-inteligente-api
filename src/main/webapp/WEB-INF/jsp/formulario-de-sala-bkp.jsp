<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<!--tab start-->
	<div class="container-fluid full-width-container">
	
		<!-- Title -->
		<h1 class="section-title" id="services">
			<span>Cadastro de Filmes</span>
		</h1><!-- End Title -->
			
		<!--breadcrum start-->
		<ol class="breadcrumb text-left">
		  <li><a href="/home">Home</a></li>
		  <li class="active">Cadastro</li>
		</ol><!--breadcrum end-->
	
		<div class="section section-custom billinfo"> 
			<form id="validationForm" action="" method="post">
			<div class="pmd-card pmd-z-depth">
				<div class="pmd-card-body">
					<div class="group-fields clearfix row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="form-group pmd-textfield pmd-textfield-floating-label">
								<label for="regular1" class="control-label">
									Name*
								</label>
								<input type="text" id="regular1" class="form-control">
							</div>
						</div>
					</div>
					<div class="group-fields clearfix row">
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<div class="form-group pmd-textfield pmd-textfield-floating-label">       
								<label>City*</label>
								<select class="select-simple form-control pmd-select2">
									<option></option>
									<option>Dallas Cowboys</option>
									<option>New York Giants</option>
									<option>Philadelphia Eagles</option>
									<option>Washington Redskins</option>
									<option>Chicago Bears</option>
									<option>Detroit Lions</option>
									<option>Green Bay Packers</option>
									<option>Minnesota Vikings</option>
									<option>Arizona Cardinals</option>
									<option>St. Louis Rams</option>
									<option>San Francisco 49ers</option>
									<option>Seattle Seahawks</option>
									<option>Baltimore Ravens</option>
									<option>Cincinnati Bengals</option>
									<option>Cleveland Browns</option>
									<option>Pittsburgh Steelers</option>
									<option>Houston Texans</option>
									<option>Indianapolis Colts</option>
									<option>Jacksonville Jaguars</option>
									<option>Tennessee Titans</option>
									<option>Denver Broncos</option>
									<option>Kansas City Chiefs</option>
									<option>Oakland Raiders</option>
									<option>San Diego Chargers</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<div class="form-group pmd-textfield pmd-textfield-floating-label">       
								<label>State*</label>
								<select class="select-simple form-control pmd-select2">
									<option></option>
									<option>Dallas Cowboys</option>
									<option>New York Giants</option>
									<option>Philadelphia Eagles</option>
									<option>Washington Redskins</option>
									<option>Chicago Bears</option>
									<option>Detroit Lions</option>
									<option>Green Bay Packers</option>
									<option>Minnesota Vikings</option>
									<option>Arizona Cardinals</option>
									<option>St. Louis Rams</option>
									<option>San Francisco 49ers</option>
									<option>Seattle Seahawks</option>
									<option>Baltimore Ravens</option>
									<option>Cincinnati Bengals</option>
									<option>Cleveland Browns</option>
									<option>Pittsburgh Steelers</option>
									<option>Houston Texans</option>
									<option>Indianapolis Colts</option>
									<option>Jacksonville Jaguars</option>
									<option>Tennessee Titans</option>
									<option>Denver Broncos</option>
									<option>Kansas City Chiefs</option>
									<option>Oakland Raiders</option>
									<option>San Diego Chargers</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<div class="form-group pmd-textfield pmd-textfield-floating-label">
								<label for="regular1" class="control-label">
									Zip Code*
								</label>
								<input type="text" id="regular1" class="form-control">
							</div>
						</div>
					</div>
					<div class="group-fields clearfix row">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="form-group pmd-textfield pmd-textfield-floating-label">
							   <label for="regular1" class="control-label">
								 Phone*
							   </label>
							   <input type="text" id="regular1" class="form-control">
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						   <div class="form-group pmd-textfield pmd-textfield-floating-label">
							   <label for="regular1" class="control-label">
								 Email*
							   </label>
							   <input type="text" id="regular1" class="form-control">
							</div>
						</div>
					</div>
					<div class="group-fields clearfix row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="form-group pmd-textfield pmd-textfield-floating-label">
							  <label class="control-label">Endereço</label>
							  <textarea required class="form-control"></textarea>
							</div>
						</div>
					</div>
					<div class="group-fields clearfix row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="checkbox pmd-default-theme">
								<label class="pmd-checkbox checkbox-pmd-ripple-effect">
									<input type="checkbox" value="">
									<span>Salvar Detalhes</span>
								</label>
							</div>
						</div>
					</div>
				</div>		
				<div class="pmd-card-actions">
					<a href="javascript:void(0);" class="btn btn-primary next">Enviar</a>
<!-- 					<a href="javascript:void(0);" class="btn btn-default">Cancel</a> -->
				</div>
			</div> 
			</form>
		</div>
	</div>
</div>

<jsp:include page="includes/include-footer.jsp"/>

<jsp:include page="includes/include-formulario-scripts.jsp"/>

</body>
</html>