$(function() {
	var $window = $(window);
	var setMaxHeight = function() {
		$('#autoscroll').css('height', $window.height() - 162);
	}
	$window.on('resize', setMaxHeight);
	setMaxHeight();
});