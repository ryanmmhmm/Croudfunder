$(document).on('ready page:load',function(){
	$('#search').submit(function(event){
		event.preventDefault();
		var searchValue = $('#title').val();

		$.getScript('/projects?title=' + searchValue)
	});

	$('.project-percent-pledge').each(function(index, element){
		var percent_funded = $(element).data("percentage");
		$(element).css("width", percent_funded + "%");
	})


});



