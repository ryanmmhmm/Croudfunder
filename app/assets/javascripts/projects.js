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

	$('.category-display').click(function(event){
		event.preventDefault();
		var categoryName = $(this).text();
		$.ajax({
			url: '/projects?name=' + categoryName,
			method: 'get',
			success: function(data){
				$('#fuck-ryan').html(data)
			},
			dataType: "html"
		});
	});

	$('.all-projects').click(function(event){
		event.preventDefault();
	$.ajax({
		url: '/projects?project=all',
		method: 'get',
		success: function(data){
			$('#projects').html(data)
		},
		dataType: "html"
		});
	});

});



