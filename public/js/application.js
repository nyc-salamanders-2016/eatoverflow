$(document).ready(function() {
    //this shows the comment form for questions
  $('#comment_question_button').submit(function(event){
    event.preventDefault();
    $.ajax({
      method: 'GET',
      url: $(event.target).attr('action')
    }).done(function(response){
      $('#comment_question_form_container').html(response);
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

  $('#show_questions').on('submit', '.comment_answer_button', function(event){
    event.preventDefault();
    $.ajax({
      method: 'GET',
      url: $(event.target).attr('action')
    }).done(function(response){
      $(event.target).next().html(response)
    });
  })

  //this submits the comment form for answers

   $('.comment_answer_button_container').on('submit', '#comment_answer_form', function(event){
    event.preventDefault();
      $('#comment_answer_form').remove();
    $.ajax({
      method: $(event.target).attr('method'),
      url: $(event.target).attr('action'),
      data: $(event.target).serialize()
    }).done(function(response){
      $('.comment_answer_container').append(response);
    })
  });

  //this upvotes a question

  $('#question-upvote').submit(function(event){
    event.preventDefault();
    var vote = $(event.target).find("input[value='vote']").val();
    var request = $.ajax({
      method: 'POST',
      url: $(event.target).attr("action"),
      data: {vote: vote}
    });
    request.done(function(response){
      $(event.target).next().next().next().html(response)
    });
  });

  //this downvotes a question

  $('#question-downvote').submit(function(event){
    event.preventDefault();
    var vote = $(event.target).find("input[value='vote']").val();
    var request = $.ajax({
      method: 'POST',
      url: $(event.target).attr("action"),
      data: {vote: vote}
    });
    request.done(function(response){
      $(event.target).next().next().html(response)
    });
  });

  //this upvotes answer

  $('#show_questions').on("submit", ".answer-upvote", function(event){
    event.preventDefault();
    var vote = $(event.target).find("input[value='upvote']").val();
    var request = $.ajax({
      method: 'POST',
      url: $(event.target).attr("action"),
      data: {vote: vote}
    });
    request.done(function(response){
      $(event.target).next().next().html(response)
    });
  });

  //this downvotes a question

  $('#show_questions').on("submit", ".answer-downvote", function(event){
    event.preventDefault();
    var vote = $(event.target).find("input[value='vote']").val();
    var request = $.ajax({
      method: 'POST',
      url: $(event.target).attr("action"),
      data: {vote: vote}
    });
    request.done(function(response){
      $(event.target).next().html(response)
    });
  });

  //submit answer form
  $('#new_answer_form').submit(function(event){
    event.preventDefault();
    debugger
    $.ajax({
      method: $(event.target).attr('method'),
      url: $(event.target).attr('action'),
      data: $(event.target).serialize()
    }).done(function(response){
      debugger
      $('#display_answers').append(response);
      $('#new_answer_form textarea').val(' ');
    })
  })

});
