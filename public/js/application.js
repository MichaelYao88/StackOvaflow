$(document).ready(function() {
  $('.upboat').on('click', function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    var $that = $(this)

    $.ajax({
      type: 'POST',
      url: url

    }).done(function(data){
      $that.closest(".parent").find(".upvotes").text(data);
    });
  });
});
