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

  $('.delete').on('submit', function(event){
    event.preventDefault();
    var $that = $(this)
    var url = $that.attr('action')
    console.log(url)

    $.ajax({
      type: 'DELETE',
      url: url
    }).done(function(data){
      $that.closest('.parent').remove()
    });
  });

  $(".fav_container").on("submit", '.favorite_pick', function(event){
      event.preventDefault();
      $('.best_answer').removeClass('best_answer');
      var $that = $(this);
      var url = $that.attr('action');

      request = $.ajax({
        url: url,
        method: 'GET'
      })
      request.done(function(response){
        $that.closest('.parent').addClass('best_answer');

      });

  }); // 


  $('.answerform').on('submit', function( event ){
    event.preventDefault();
    $(this).hide();
    $(this).closest('.answers').find('.hiddenform').removeClass('hiddenform');
  });



});


