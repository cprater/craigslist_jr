$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com

  $('#profile_comments').on('click', function(){
    // console.log('here')
    var data = {
      user_id: 1
    }

    $.post('/user_comments', data, function(serverResponse){
      console.log(serverResponse);
    }, 'json');



  });


});
