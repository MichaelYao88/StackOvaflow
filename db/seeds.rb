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
