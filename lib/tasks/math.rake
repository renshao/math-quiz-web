require 'question_generator'
require 'bin_hex_question_generator'
require 'kindergarten_question_generator'
require 'summer_question_generator'
require 'year1_question_generator'
require 'year1_plus_generator'
require 'year2_times_question_generator'
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

  task generate_year1: :environment do
    generator = Year1QuestionGenerator.new

    questions_sets = []
    500.times { questions_sets << generator.gen_questions_set }

    File.write('year1_questions_sets.json', questions_sets.to_json)
  end

  task generate_year1_plus: :environment do
    generator = Year1PlusGenerator.new

    questions_sets = []
    500.times { questions_sets << generator.gen_questions_set }

    File.write('year1_plus_sets.json', questions_sets.to_json)
  end

  task generate_year2_times: :environment do
    generator = Year2TimesQuestionGenerator.new

    questions_sets = []
    500.times { questions_sets << generator.gen_questions_set }

    File.write('year2_times_questions_sets.json', questions_sets.to_json)
  end
end
