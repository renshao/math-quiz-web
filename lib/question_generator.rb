class QuestionGenerator
  def initialize
    srand(2020)
  end

  def gen_questions_set
    times_questions = []
    30.times do
      q = gen_times
      redo if times_questions.include? q
      times_questions << q
    end

    plus_minus_questions = []
    27.times { plus_minus_questions << gen_three_digit_plus_minus }
    3.times { plus_minus_questions << gen_plus_equal_500 }
    plus_minus_questions.shuffle!

    {
      id: rand(100000..999999),
      questions: times_questions + plus_minus_questions
    }
  end

  def gen_three_digit_plus_minus
    a = rand(1..999)
    b = rand(1..999)
    sign = ['+', '-'].sample

    if sign == '-' && a < b
      a,b = b,a
    end

    answer = sign == '+' ? a + b : a - b

    [a, sign, b, answer]
  end

  def gen_plus_equal_500
    sum = 500
    a = rand(1..499)
    b = sum - a
    [a, '+', b, 500]
  end

  def gen_times
    a = rand(3..7)
    b = rand(1..9)
    [a, 'x', b, a * b]
  end
end
