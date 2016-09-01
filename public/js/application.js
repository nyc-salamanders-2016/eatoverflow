// ajax for comments on questions
$(document).ready(function() {
  $('#question_container').on('submit', '#comment_question_form', function(event){
    event.preventDefault();
    $.ajax({
      method: $(event.target).attr('method'),
      url: ,
      data:
    }).done(function(response){

    })

  })
});

// ajax for comments on answers
