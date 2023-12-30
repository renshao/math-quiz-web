Rails.application.routes.draw do
  root 'application#index'
  get 'quizzes/random', to: 'quizzes#show_random'
  get 'quizzes(/:id)', to: 'quizzes#show'

  get 'quizzes-bin-hex/random', to: 'quizzes#show_bin_hex_random'
  get 'quizzes-bin-hex(/:id)', to: 'quizzes#show_bin_hex'

  get 'quizzes-kinder/random', to: 'quizzes#show_kinder_random'
  get 'quizzes-kinder(/:id)', to: 'quizzes#show_kinder'

  get 'quizzes-year1/random', to: 'quizzes#show_year1_random'
  get 'quizzes-year1(/:id)', to: 'quizzes#show_year1'

  get 'quizzes-year1-plus/random', to: 'quizzes#show_year1_plus_random'
  get 'quizzes-year1-plus(/:id)', to: 'quizzes#show_year1_plus'

  get 'quizzes-summer/random', to: 'quizzes#show_summer_random'
  get 'quizzes-summer(/:id)', to: 'quizzes#show_summer'
end
