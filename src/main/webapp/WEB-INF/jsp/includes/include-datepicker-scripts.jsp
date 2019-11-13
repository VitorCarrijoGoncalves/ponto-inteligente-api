<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!-- Scripts Starts -->

<script type="text/javascript" language="javascript" src="assets/js/moment-with-locales.js"></script>
<script type="text/javascript" language="javascript" src="assets/js/bootstrap-datetimepicker.js"></script>

<script>
	// Default date and time picker
	$('#datetimepicker-default').datetimepicker();
	
	// View mode datepicker [shows only years and month]
	$('#datepicker-view-mode').datetimepicker({
		viewMode: 'years',
		format: 'MM/YYYY'
	});
	
	// Inline datepicker
	$('#datepicker-inline').datetimepicker({
		inline: true
	});
	
	// Time picker only
	$('#timepicker').datetimepicker({
		format: 'LT'
	});
	
	// Linked date and time picker 
	// start date date and time picker 
	$('#datepicker-start').datetimepicker();

	// End date date and time picker 
	$('#datepicker-end').datetimepicker({
		useCurrent: false 
	});
	
	// start date picke on chagne event [select minimun date for end date datepicker]
	$("#datepicker-start").on("dp.change", function (e) {
		$('#datepicker-end').data("DateTimePicker").minDate(e.date);
	});
	// Start date picke on chagne event [select maxmimum date for start date datepicker]
	$("#datepicker-end").on("dp.change", function (e) {
		$('#datepicker-start').data("DateTimePicker").maxDate(e.date);
	});
	
	// Disabled Days of the Week (Disable sunday and saturday) [ 0-Sunday, 1-Monday, 2-Tuesday   3-wednesday 4-Thusday 5-Friday 6-Saturday]
	$('#datepicker-disabled-days').datetimepicker({
		 daysOfWeekDisabled: [0, 6]
	});
	
	// Datepicker in popup
	$('#datepicker-popup-inline').datetimepicker({
		inline: true
	});
	
	$("[data-header-left='true']").parent().addClass("pmd-navbar-left");
	
	// Datepicker left header
	$('#datepicker-left-header').datetimepicker({
		'format' : "YYYY-MM-DD HH:mm:ss", // HH:mm:ss
	});
</script>