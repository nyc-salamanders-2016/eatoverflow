// ajax for comments

$(document).ready(function() {
    //this shows the comment form for questions
  $('#comment_question_button').submit(function(event){
    event.preventDefault();
    $.ajax({
      method: 'GET',
      url: $(event.target).attr('action')
    }).done(function(response){
      $('#comment_question_button_container').html(response);
    });
  })

    // this submits the comment form for questions
  $('#comment_question_button_container').on('submit', '#comment_question_form', function(event){
    event.preventDefault();
      $('#comment_question_form').remove();
    $.ajax({
      method: $(event.target).attr('method'),
      url: $(event.target).attr('action'),
      data: $(event.target).serialize()
    }).done(function(response){
      $('#comment_question_container').append(response);
    })
  })

  //this shows the comment form for answers





});
