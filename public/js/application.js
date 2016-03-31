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

  $('.downboat').on('click', function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    var $that = $(this)

    $.ajax({
      type: 'POST',
      url: url

    }).done(function(data){
      $that.closest('.parent').find('.upvotes').text(data);
    });
  });

  $('.btn btn-link').on('click', function(event){
    event.preventDefault();
    $.ajax({
      type: 'DELETE'
      url: '/questions'
    })
  });
});


