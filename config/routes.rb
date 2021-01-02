Rails.application.routes.draw do
  root 'application#index'
  get 'quizzes/random', to: 'quizzes#show_random'
  get 'quizzes(/:id)', to: 'quizzes#show'

  get 'quizzes-summer/random', to: 'quizzes#show_summer_random'
  get 'quizzes-summer(/:id)', to: 'quizzes#show_summer'
end
