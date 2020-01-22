u1 = User.create(name: "demarius")

q1 = Question.create(inquiry: "She couldn't afford a car so she named her daughter ____", answer: "Alexus")
q2 = Question.create(inquiry: "What song does this clip from?", answer: "Power")
q3 = Question.create(inquiry: "What year did he write the iconic song, Gold Digger", answer: "2005")
q4 = Question.create(inquiry: "Where was Kanye born?", answer: "Atlanta")
q5 = Question.create(inquiry: "I named one of my children after what biblical reference?", answer: "Psalm")
q6 = Question.create(inquiry: "What album did this pivotal banger 'Gotta Have It' come from?", answer: "Watch the Throne")
q7 = Question.create(inquiry: "What was the name of Kanye's first clothing line", answer: "Pastelle")
q8 = Question.create(inquiry: "Who is the president of my record label 'GOOD MUSIC'?", answer: "Pusha T")
q9 = Question.create(inquiry: "I had to take ha to that Ghetto ___", answer: "University")
q10 = Question.create(inquiry: "What song did Kanye produce on Drake's debut album?", answer: "Show Me A Good Time")

uq1 = UserQuestion.create(user_id: u1.id, question_id: q1.id)