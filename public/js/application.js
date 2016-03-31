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


  $('.answerform').on('submit', function( event ){
    event.preventDefault();
    $(this).hide();
    $(this).closest('.answers').find('.hiddenform').removeClass('hiddenform');
  });



});


