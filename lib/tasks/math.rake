require 'question_generator'
require 'bin_hex_question_generator'
require 'kindergarten_question_generator'
require 'summer_question_generator'
require 'json'

namespace :math do
  desc "Generate questions library"
  task generate: :environment do
    generator = QuestionGenerator.new

    questions_sets = []
    1000.times { questions_sets << generator.gen_questions_set }

    File.write('questions_sets.json', questions_sets.to_json)
  end

  task generate_bin_hex: :environment do
    generator = BinHexQuestionGenerator.new

    questions_sets = []
    1000.times { questions_sets << generator.gen_questions_set }

    File.write('bin_hex_questions_sets.json', questions_sets.to_json)
  end

  task generate_summer: :environment do
    generator = SummerQuestionGenerator.new

    questions_sets = []
    10.times { questions_sets << generator.gen_questions_set }

    File.write('summer_questions_sets.json', questions_sets.to_json)
  end

  task generate_kinder: :environment do
    generator = KindergartenQuestionGenerator.new

    questions_sets = []
    100.times { questions_sets << generator.gen_questions_set }

    File.write('kinder_questions_sets.json', questions_sets.to_json)
  end
end
