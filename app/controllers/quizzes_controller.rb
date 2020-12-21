class QuizzesController < ApplicationController
  def show
    @quiz_id = params[:id].to_i
    @questions = Rails.application.config.quizzes[@quiz_id]
  end

  def show_random
    quiz_id = Rails.application.config.quizzes.keys.sample
    redirect_to action: :show, id: quiz_id
  end
end
