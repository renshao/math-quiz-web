class KindergartenQuestionGenerator
  def initialize
    srand(2021)
  end

  def gen_questions_set
    questions = []
    20.times do
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
    a = rand(1..6)
    b = rand(1..6)
    sign = '+'
    answer = a + b

    [a, sign, b, answer]
  end
end
