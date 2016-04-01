require 'Faker'

#hard coded seeds
whaley_wonka = User.create!(name: "Whaley Wonka", password: "password");
whalliam = User.create!(name: "Whalliam", password: "password");
bruce = User.create!(name: "Bruce Whallis", password: "password");

question1 = whaley_wonka.questions.create!(question_title: "Whale I ever be happy?", question_body: "whale I ever be happy")
answer1 = question1.answers.create!(answerer: whaley_wonka, text: "spouting makes me happy briefly" )
comment1 = answer1.comments.create!(commenter: whalliam, text: "I heard if you don't spout in a while...")
vote1 = comment1.votes.create!(voter: bruce, value: 1)


question2 = whalliam.questions.create!(question_title: "What do whales eat?", question_body: "???")
answer2 = question2.answers.create!(answerer: bruce, text: "Fish and ships?"  )
comment2 = answer2.comments.create!(commenter: whaley_wonka, text: "I don't know what?")
vote2 = comment2.votes.create!(voter: bruce, value: 1)

question3 = bruce.questions.create!(question_title: "What is the sexiest whale?", question_body: "whale I ever be happy")

question4 = whalliam.questions.create!(question_title: "Whale weight loss tips?", question_body: "whale I ever be happy")

question5 = bruce.questions.create!(question_title: "Whale I do whale on the self-assessment?", question_body: "Fuck baleen whales")
#create 10 new users at random
10.times do
  User.create!({
      name: Faker::Superhero.name,
      password: "password"
    })
end


#create 10 new questions
10.times do
  user = User.all.sample
  user.questions.create!({
      question_title: Faker::Hacker.adjective + " " + Faker::Hipster.word,
      question_body: Faker::Hipster.sentence
    })
end

100.times do
  user = User.all.sample
  question = Question.all.sample
  question.answers.create!({
    answerer: user,
    text: Faker::Lorem.sentence
    })
end

100.times do
  user = User.all.sample
  question = Question.all.sample
  answer = Answer.all.sample
  question.comments.create!({
    text: Faker::Hipster.sentence,
    commenter: user
    })

  answer.comments.create!({
    text: Faker::Hipster.sentence,
    commenter: user
    })
end

50.times do
	question1.votes.create!({value: 1})
	question2.votes.create!({value: 1})
	question3.votes.create!({value: 1})
	question4.votes.create!({value: 1})
	question5.votes.create!({value: 1})
	question = Question.all.sample
	question.votes.create!({value: 1})
end


