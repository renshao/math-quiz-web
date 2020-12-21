Rails.application.routes.draw do
  root 'application#index'
  get 'quizzes/random', to: 'quizzes#show_random'
  get 'quizzes(/:id)', to: 'quizzes#show'
end
