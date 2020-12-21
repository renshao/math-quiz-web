file = File.read("#{Rails.root}/questions_sets.json")
quizzes = ActiveSupport::JSON.decode file

quizzes_hash = {}
quizzes.each { |quiz| quizzes_hash[quiz['id']] = quiz['questions'] }

Rails.application.config.quizzes = quizzes_hash
