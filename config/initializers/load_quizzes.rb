file = File.read("#{Rails.root}/questions_sets.json")
quizzes = ActiveSupport::JSON.decode file
quizzes_hash = {}
quizzes.each { |quiz| quizzes_hash[quiz['id']] = quiz['questions'] }
Rails.application.config.quizzes = quizzes_hash

file = File.read("#{Rails.root}/bin_hex_questions_sets.json")
quizzes = ActiveSupport::JSON.decode file
quizzes_hash = {}
quizzes.each { |quiz| quizzes_hash[quiz['id']] = quiz }
Rails.application.config.bin_hex_quizzes = quizzes_hash

file = File.read("#{Rails.root}/kinder_questions_sets.json")
quizzes = ActiveSupport::JSON.decode file
quizzes_hash = {}
quizzes.each { |quiz| quizzes_hash[quiz['id']] = quiz['questions'] }
Rails.application.config.kinder_quizzes = quizzes_hash

file = File.read("#{Rails.root}/year1_questions_sets.json")
quizzes = ActiveSupport::JSON.decode file
quizzes_hash = {}
quizzes.each { |quiz| quizzes_hash[quiz['id']] = quiz['questions'] }
Rails.application.config.year1_quizzes = quizzes_hash

file = File.read("#{Rails.root}/year1_plus_sets.json")
quizzes = ActiveSupport::JSON.decode file
quizzes_hash = {}
quizzes.each { |quiz| quizzes_hash[quiz['id']] = quiz['questions'] }
Rails.application.config.year1_plus_quizzes = quizzes_hash

file = File.read("#{Rails.root}/summer_questions_sets.json")
quizzes = ActiveSupport::JSON.decode file

quizzes_hash = {}
quizzes.each { |quiz| quizzes_hash[quiz['id']] = quiz['questions'] }

Rails.application.config.summer_quizzes = quizzes_hash
