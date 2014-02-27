$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com

  $('#profile_comments').on('click', function(event){
    event.preventDefault();

    var data = {
      user_id: $(this).attr('href')
    }

    $.post('/user_comments', data, function(serverResponse){
      $('#results').html(serverResponse);
    });
  });

  $('#profile_posts').on('click', function(event){
    event.preventDefault();

    var data = {
      user_id: $(this).attr('href')
    }

    $.post('/user_posts', data, function(serverResponse){
      $('#results').html(serverResponse);
    });
  });

  $('#vote-up').on('click', function(event){
    event.preventDefault();

    var score_id = $(this).attr('href')    
    var data = {
      post_id: $(this).attr('href')
    }

    $.post('/post/up_vote', data, function(serverResponse){
      $('#' + score_id).html(serverResponse);
    },'json')
  })
});




















