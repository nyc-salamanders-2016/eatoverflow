
question1 = Question.create( title: "What is a man?", body: "This is a body", user_id: 1 )

question1 = Question.create( title: "How many roads must a man walk down?", body: "This is a body", user_id: 1 )

answer1 = Answer.create( body: "Man is a being of spirit", user_id: 1, question_id: 1 )

answer2 = Answer.create( body: "A miserable little pile of secrets!", user_id: 2, question_id: 1 )

user1 = User.create( username: "mark_twain", email: "mark@twain.com", password: "asdfasdf" )

user2 = User.create( username: "dracula", email: "dracula@romania.com", password: "asdfasdf" )

user3 = User.create( username: "eevee", email: "eevee@pokeman.com", password: "asdfasdf" )


tag1 = Tag.create( name: "philosophy", question_id: 1 )
tag2 = Tag.create( name: "philosophy", question_id: 2 )


# vote1 = Vote.create( user_id: 3, value: 1, voteable_id: 1 voteable_type: ???? )

# comment1 = Comment.create( user_id: 3 )