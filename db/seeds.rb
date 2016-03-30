whaley_wonka = User.create!(name: "Whaley Wonka", password: "password" );
whalliam = User.create!(name: "Whalliam", password: "password");
bruce = User.create!(name: "Bruce Whallis", password: "password");

question1 = whaley_wonka.questions.build(question_body: "whale I ever be happy")
answer1 = question1.answers.build(text: "spouting makes me happy briefly" )
