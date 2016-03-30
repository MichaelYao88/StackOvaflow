whaley_wonka = User.create!(name: "Whaley Wonka");
whalliam = User.create!(name: "Whalliam");
bruce = User.create!(name: "Bruce Whallis");

question1 = whaley_wonka.questions.create!(question_body: "whale I ever be happy")
answer1 = question1.answers.create!(answerer: whaley_wonka, text: "spouting makes me happy briefly" )
comment1 = answer1.comments.create!(commenter: whalliam, text: "I heard if you don't spout in a while...")
vote1 = comment1.votes.create!(voter: bruce, value: 1)
