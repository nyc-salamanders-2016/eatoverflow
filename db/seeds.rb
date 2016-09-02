
user1 = User.create( username: "mark_twain", email: "mark@twain.com", password: "asdfasdf" )

user2 = User.create( username: "dracula", email: "dracula@romania.com", password: "asdfasdf" )

user3 = User.create( username: "eevee", email: "eevee@pokeman.com", password: "asdfasdf" )

user4 = User.create( username: "GlaDOS", email: "glados@glados.com", password: "asdfasdf" )

question1 = Question.create( title: "What is a man?", body: "This is a body", user_id: 2 )

question2 = Question.create( title: "What is a dog", body: "This is a body", user_id: 1 )

question3 = Question.create( title: "How many roads must a man walk down?", body: "This is a body", user_id: 1 )

question4 = Question.create( title: "Did you know you can donate one or all of your vital organs to the Aperture Science self esteem fund for girls?", body: "It's true!", user_id: 4 )

question5 = Question.create( title: "What is tea time?", body: "This is a body", user_id: 1 )

question4 = Question.create( title: "What is Snorlax?", body: "It's true!", user_id: 4 )

answer1 = Answer.create( body: "Man is a being of spirit", user_id: 1, question_id: 1 )

answer2 = Answer.create( body: "A miserable little pile of secrets!", user_id: 2, question_id: 1 )

tag1 = Tag.create( name: "philosophy", question_id: 1 )

tag2 = Tag.create( name: "pokemon", question_id: 2 )

comment1 = Question.first.comments.create( body: "This is a comment from seed on a question.", user_id: 1 )

comment2 = Answer.first.comments.create( body: "This is a comment from seed on an answer.", user_id: 1 )

comment3 = Answer.first.comments.create( body: "Enough comments already!", user_id: 4 )

vote1 = Vote.create( user_id: 3, value: 1, voteable_id: 1, voteable_type: "Question" )
