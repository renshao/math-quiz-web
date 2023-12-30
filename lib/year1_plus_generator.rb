class Year1PlusGenerator
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
    a = rand(1..39)
    b = rand(1..39)

    sign = '+'
    answer = a + b

    [a, sign, b, answer]
  end
end
