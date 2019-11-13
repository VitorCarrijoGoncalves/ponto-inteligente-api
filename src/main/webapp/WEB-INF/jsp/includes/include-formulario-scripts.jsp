<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!-- Scripts Starts -->
<script src="assets/js/jquery-1.12.2.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/propeller.min.js"></script>
<script>
	$(document).ready(function() {
		var sPath=window.location.pathname;
		var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
		$(".pmd-sidebar-nav").each(function(){
			$(this).find("a[href='"+sPage+"']").parents(".dropdown").addClass("open");
			$(this).find("a[href='"+sPage+"']").parents(".dropdown").find('.dropdown-menu').css("display", "block");
			$(this).find("a[href='"+sPage+"']").parents(".dropdown").find('a.dropdown-toggle').addClass("active");
			$(this).find("a[href='"+sPage+"']").addClass("active");
		});
		$(".auto-update-year").html(new Date().getFullYear());
	});
</script> 
<!-- Select2 js-->
<script type="text/javascript" src="components/select2/js/select2.full.js"></script>

<!-- Propeller Select2 -->
<script type="text/javascript">
	$(document).ready(function() {
		<!-- Simple Selectbox -->
		$(".select-simple").select2({
			theme: "bootstrap",
			minimumResultsForSearch: Infinity,
		});
		<!-- Selectbox with search -->
		$(".select-with-search").select2({
			theme: "bootstrap"
		});
		<!-- Select Multiple Tags -->
		$(".select-tags").select2({
			tags: false,
			theme: "bootstrap",
		});
		<!-- Select & Add Multiple Tags -->
		$(".select-add-tags").select2({
			tags: true,
			theme: "bootstrap",
		});
	});
</script>
<script type="text/javascript" src="components/select2/js/pmd-select2.js"></script>
<script>
	$(document).ready(function() {
		var sPath=window.location.pathname;
		var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
		$(".pmd-sidebar-nav").each(function(){
			$(this).find("a[href='"+sPage+"']").parents(".dropdown").addClass("open");
			$(this).find("a[href='"+sPage+"']").parents(".dropdown").find('.dropdown-menu').css("display", "block");
			$(this).find("a[href='"+sPage+"']").parents(".dropdown").find('a.dropdown-toggle').addClass("active");
			$(this).find("a[href='"+sPage+"']").addClass("active");
		});
	});
</script>
<!-- login page sections show hide -->
<script type="text/javascript">
	$(document).ready(function(){
	 $('.app-list-icon li a').addClass("active");
		$(".login-for").click(function(){
			$('.login-card').hide()
			$('.forgot-password-card').show();
		});
		$(".signin").click(function(){
			$('.login-card').show()
			$('.forgot-password-card').hide();
		});
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
		$(".login-register").click(function(){
			$('.login-card').hide()
			$('.forgot-password-card').hide();
			$('.register-card').show();
		});
		
		$(".register-login").click(function(){
			$('.register-card').hide()
			$('.forgot-password-card').hide();
			$('.login-card').show();
		});
		$(".forgot-password").click(function(){
			$('.login-card').hide()
			$('.register-card').hide()
			$('.forgot-password-card').show();
		});	
});
</script> 

<script>

	$('#mensagem-sucesso').hide();
	$('#mensagem-erro').hide();

	$('#btn-submit').click(function() {
		// Validar para que se o envio de dados tiver funcionado, mostrar a mensagem de sucesso, se não, mostrar a de erro
	});
		


</script>

<!-- Scripts Ends -->