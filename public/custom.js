// The guess JS.

var theGuess = {

	submitWordList: function(){

	},
	seedChange: function(_this, e){
		var seeds = $(_this).val();

		var words = seeds.split("\n");	
		var len = words.length;

		$("#notes-seeds").empty().append("words: " + len);

		theGuess.getEstimatedSize( len );
	},
	removeWord: function(){

	},
	getSuggestion: function(){

	},
	getEstimatedSize: function( len_seeds ){
		var estimate = 0;
		if( len_seeds == 0) len_seeds = 1;
		estimate = len_seeds * 500 * 2 * 99; // 500 worst * num in list * forward + back * nums 0-99
		$("#estimated_dict_size").empty().append("Estimated dictionary size: " + estimate)

		// estimated file size:
		// 12 bytes avg per word, convert to KB.
		var filesize = ( estimate * 12 )/ 1000;
		$("#estimated_file_size").empty().append("Estimated file size: " + filesize + " kb");
	}
};

$(document).ready( function(){
	$("#seed_area").keydown( function(event){
		theGuess.seedChange(this, event);
	})

	$('.wordlist-checkbox').each( function(i){
		if( i == 0){
			$(this).prop("checked",true);
		}
	});

	// you can only pick one word list.
	$('.wordlist-checkbox').change( function(event){
		var target = $(this).prop("id");
		$('.wordlist-checkbox').each( function(i){
			if( $(this).prop("id") != target ){
				$(this).prop("checked", false);
			}
		});
	});
});