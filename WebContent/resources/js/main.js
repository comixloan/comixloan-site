$(function() {
	var $window = $(window);
	var setHeight = function() {
		$('#autoscroll').css('height', $window.height() - 162);
	}
	$window.on('resize', setHeight);
	setHeight();
	
	var logoChange = function (){
		var logoImage = Math.random() * 3;
		logoImage = parseInt(logoImage, 10);
		
		$("#imagelogo").removeClass();
		$("#imagelogo").addClass("logos-"+ logoImage);
	}
	
	$("#imagelogo").click(function (){
		logoChange();
	});
	
	logoChange();
	
	$('.collapse').collapse()
});