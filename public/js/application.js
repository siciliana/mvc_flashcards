$(document).ready(function() {
	$('.flash').animo("rotate", { degrees:1080 }, function(e) {
		e.element.animo( { 
			animation: "flipOutX", keep: false 
		} );
	});
 
// Reset
	// $('.rotate').animo("cleanse");


});

