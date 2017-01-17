$(document).ready(function() {

  $('form#new_category').on('submit', function(e){
    var keywords = $('#keywords').material_chip('data');
    console.log(keywords);
    $('input[name="category[names]"').val(JSON.stringify(keywords))

  });

});
