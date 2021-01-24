class SummerQuestionGenerator
  def initialize
    srand(2021)
  end

  def gen_questions_set
    rainbow_questions = []
    5.times do
      q = gen_icecream_questions()
      redo if gen_icecream_questions.include? q
      rainbow_questions << q
    end

    unicorn_questions = []
    5.times do
      q = gen_frozen_questions()
      redo if gen_frozen_questions.include? q
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
    [Array.new(a) { '🐟' }.join, '+', Array.new(b) { '🐠' }.join, a + b]
  end

  def gen_unicorn_questions
    a = rand(1..9)
    b = rand(1..10-a)
    [Array.new(a) { '🌻' }.join, '+', Array.new(b) { '🌼' }.join, a + b]
  end

  def gen_icecream_questions
    a = rand(1..9)
    b = rand(1..10-a)
    [Array.new(a) { '☃️' }.join, '+', Array.new(b) { '❄️' }.join, a + b]
  end

  def gen_frozen_questions
    a = rand(1..9)
    b = rand(1..10-a)
    [Array.new(a) { '🐟' }.join, '+', Array.new(b) { '🦄' }.join, a + b]
  end
end
