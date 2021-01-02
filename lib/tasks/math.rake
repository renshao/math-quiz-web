require 'question_generator'
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

  task generate_summer: :environment do
    generator = SummerQuestionGenerator.new

    questions_sets = []
    3.times { questions_sets << generator.gen_questions_set }

    File.write('summer_questions_sets.json', questions_sets.to_json)
  end
end
