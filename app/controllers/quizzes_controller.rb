class QuizzesController < ApplicationController
  def show
    @quiz_id = params[:id].to_i
    @emojies = ['☀️', '🌤', '⚡️', '❄️']
    @questions = Rails.application.config.quizzes[@quiz_id]
  end

  def show_random
    quiz_id = Rails.application.config.quizzes.keys.sample
    redirect_to action: :show, id: quiz_id
  end

  def show_kinder
    @quiz_id = params[:id].to_i
    @emojies = ['☀️', '🌤', '⚡️', '❄️']
    @questions = Rails.application.config.kinder_quizzes[@quiz_id]
  end

  def show_kinder_random
    quiz_id = Rails.application.config.kinder_quizzes.keys.sample
    redirect_to action: :show_kinder, id: quiz_id
  end

  def show_summer
    @quiz_id = params[:id].to_i
    @questions = Rails.application.config.summer_quizzes[@quiz_id]
  end

  def show_summer_random
    quiz_id = Rails.application.config.summer_quizzes.keys.sample
    redirect_to action: :show_summer, id: quiz_id
  end
end
