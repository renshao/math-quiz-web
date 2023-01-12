class Year1QuestionGenerator
    def initialize
      srand(2022)
    end
  
    def gen_questions_set
      questions = []
      21.times do
        q = gen_questions()
        redo if questions.include? q
        questions << q
      end
  
      {
        id: rand(100000..999999),
        questions: questions
      }
    end
  
    def gen_questions
      a = rand(1..5)
      b = rand(1..5)

      sign = 'x'
      answer = a * b
  
      order = rand(0..1)
      if order == 0
        [a, sign, b, answer]
      else
        [b, sign, a, answer]
      end
    end
  end
  