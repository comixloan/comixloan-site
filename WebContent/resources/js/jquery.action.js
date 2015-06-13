$(function (){
	$.fn.action = function (data){
		var self = $(this);
		$.each(data, function (key, value){
			self.append("<input type = 'hidden' name = '"+key+"' value = '"+value+"' />");
		})
		$("input[type='submit']", self).click()
	};
	
	$(".formhide").each(function (){
		$(this).hide();
	});
});