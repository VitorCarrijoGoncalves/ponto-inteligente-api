<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Propeller Admin Dashboard">
<meta content="width=device-width, initial-scale=1, user-scalable=no" name="viewport">

<title>Cinema Propeller</title>

<jsp:include page="includes/include-home-head.jsp"/>

<body>

<jsp:include page="includes/include-sidebar.jsp"/>
	
	<div id="content" class="pmd-content content-area dashboard">

		<div class="container-fluid">
			<div class="row" id="card-masonry">
			 	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
					 <div class="pmd-card pmd-card-default pmd-z-depth">
						<div class="pmd-card-title">
						  <div class="media-left">
							<a class="avatar-list-img" href="javascript:void(0);">
<!-- 								<img src="http://propeller.in/components/list/img/40x40.png" width="40" height="40"> -->
								<c:forEach items="${filmes}" var="filme">
								<img src="${filme.capaDoFilme }" width="40" height="40">
								</c:forEach>
							</a>
						  </div>
						  <div class="media-body media-middle">
							<h3 class="pmd-card-title-text">Two-line item</h3>
							<span class="pmd-card-subtitle-text">Secondary text</span>
						  </div>
						</div>
						<div class="pmd-card-media">
							<img src="http://propeller.in/assets/images/profile-pic.png" width="1184" height="666" class="img-responsive">
						</div>
						<div class="pmd-card-title">
							<h2 class="pmd-card-title-text">Title goes here</h2>
							<span class="pmd-card-subtitle-text">Secondary text</span>	
						</div>	
						<div class="pmd-card-body">
							Cards provide context and an entry point to more robust information and views. Don't overload cards with extraneous information or actions.
						</div>
					</div>
		 		</div>
			</div>
		</div>

	</div><!--end content area-->

<jsp:include page="includes/include-footer.jsp"/>

<jsp:include page="includes/include-home-scripts.jsp"/>
</body>
</html>