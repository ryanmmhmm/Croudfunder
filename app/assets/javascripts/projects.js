$(document).on('ready page:load',function(){
	$('#search').submit(function(event){
		event.preventDefault();
		var searchValue = $('#title').val();

		$.getScript('/projects?title=' + searchValue)
	});
});