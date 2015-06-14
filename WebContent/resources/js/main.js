$(function() {
	var $window = $(window);
	var setHeight = function() {
		$('#autoscroll').css('height', $window.height() - 162);
	}
	$window.on('resize', setHeight);
	setHeight();
});