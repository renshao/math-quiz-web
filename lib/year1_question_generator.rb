class Year1QuestionGenerator
    def initialize
      srand(2022)
    end
  
    def gen_questions_set
      questions = []
      54.times do
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
      is_one = rand(0..200)
      a = is_one == 0 ? 1 : rand(2..10)

      is_one = rand(0..200)
      b = is_one == 0 ? 1 : rand(2..5)

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
  