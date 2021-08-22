class BinHexQuestionGenerator
    def initialize
      srand(2020)
    end
  
    def gen_questions_set
      times_division_questions = []
      24.times do
        q = [true, false].sample ? gen_times : gen_division
        redo if times_division_questions.include? q
        times_division_questions << q
      end
  
      plus_minus_questions = []
      21.times { plus_minus_questions << gen_three_digit_plus_minus }
      plus_minus_questions.shuffle!
  
      binary_questions = []
      6.times { binary_questions << gen_binary_questions }
  
      hex_conversion_questions = []
      6.times { hex_conversion_questions << gen_hex_conversion_questions }
  
      {
        id: rand(100000..999999),
        times_division_questions: times_division_questions, 
        plus_minus_questions: plus_minus_questions,
        binary_questions: binary_questions,
        hex_conversion_questions: hex_conversion_questions
      }
    end
  
    def gen_binary_questions
      a = rand(1..16)
      b = rand(1..16)
      answer = a + b
  
      [a.to_s(2).rjust(5, '0'), '+', b.to_s(2).rjust(5, '0'), answer]
    end
  
    def gen_hex_conversion_questions
      a = rand(1..33)
      ["0x#{a.to_s(16).upcase}", 'to binary', '', a.to_s(2)]
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
  
    def gen_division
      a = rand(3..9)
      b = rand(2..9)
      [a * b, '÷', b, a]
    end
  end
  