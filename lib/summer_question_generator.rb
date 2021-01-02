class SummerQuestionGenerator
  def initialize
    srand(2020)
  end

  def gen_questions_set
    rainbow_questions = []
    5.times do
      q = gen_rainbow_questions()
      redo if rainbow_questions.include? q
      rainbow_questions << q
    end

    unicorn_questions = []
    5.times do
      q = gen_unicorn_questions()
      redo if unicorn_questions.include? q
      unicorn_questions << q
    end

    {
      id: rand(100000..999999),
      questions: rainbow_questions + unicorn_questions
    }
  end

  def gen_rainbow_questions
    a = rand(1..9)
    b = rand(1..10-a)
    [Array.new(a) { '🌈' }.join, '+', Array.new(b) { '🌈' }.join, a + b]
  end

  def gen_unicorn_questions
    a = rand(1..9)
    b = rand(1..10-a)
    [Array.new(a) { '🦄' }.join, '+', Array.new(b) { '🦄' }.join, a + b]
  end
end
