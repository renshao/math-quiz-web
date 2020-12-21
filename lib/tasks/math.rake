require 'question_generator'
require 'json'

namespace :math do
  desc "Generate questions library"
  task generate: :environment do
    generator = QuestionGenerator.new

    questions_sets = []
    1000.times { questions_sets << generator.gen_questions_set }

    File.write('questions_sets.json', questions_sets.to_json)
  end
end
