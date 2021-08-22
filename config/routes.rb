Rails.application.routes.draw do
  root 'application#index'
  get 'quizzes/random', to: 'quizzes#show_random'
  get 'quizzes(/:id)', to: 'quizzes#show'

  get 'quizzes-bin-hex/random', to: 'quizzes#show_bin_hex_random'
  get 'quizzes-bin-hex(/:id)', to: 'quizzes#show_bin_hex'

  get 'quizzes-kinder/random', to: 'quizzes#show_kinder_random'
  get 'quizzes-kinder(/:id)', to: 'quizzes#show_kinder'

  get 'quizzes-summer/random', to: 'quizzes#show_summer_random'
  get 'quizzes-summer(/:id)', to: 'quizzes#show_summer'
end
