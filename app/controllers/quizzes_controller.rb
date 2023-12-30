class QuizzesController < ApplicationController
  def show
    @quiz_id = params[:id].to_i
    @emojies = generate_emojis
    @questions = Rails.application.config.quizzes[@quiz_id]
  end

  def show_random
    quiz_id = Rails.application.config.quizzes.keys.sample
    redirect_to action: :show, id: quiz_id
  end

  def show_bin_hex_random
    quiz_id = Rails.application.config.bin_hex_quizzes.keys.sample
    redirect_to action: :show_bin_hex, id: quiz_id
  end

  def show_bin_hex
    @quiz_id = params[:id].to_i
    @emojies = generate_emojis
    @quiz = Rails.application.config.bin_hex_quizzes[@quiz_id]
  end

  def show_kinder
    @quiz_id = params[:id].to_i
    @emojies = generate_emojis
    @questions = Rails.application.config.kinder_quizzes[@quiz_id]
  end

  def show_kinder_random
    quiz_id = Rails.application.config.kinder_quizzes.keys.sample
    redirect_to action: :show_kinder, id: quiz_id
  end

  def show_year1
    @quiz_id = params[:id].to_i
    @emojies = generate_emojis
    @questions = Rails.application.config.year1_quizzes[@quiz_id]
  end

  def show_year1_random
    quiz_id = Rails.application.config.year1_quizzes.keys.sample
    redirect_to action: :show_year1, id: quiz_id
  end

  def show_year1_plus
    @quiz_id = params[:id].to_i
    @emojies = generate_emojis
    @questions = Rails.application.config.year1_plus_quizzes[@quiz_id]
  end

  def show_year1_plus_random
    quiz_id = Rails.application.config.year1_plus_quizzes.keys.sample
    redirect_to action: :show_year1_plus, id: quiz_id
  end

  def show_summer
    @quiz_id = params[:id].to_i
    @questions = Rails.application.config.summer_quizzes[@quiz_id]
  end

  def show_summer_random
    quiz_id = Rails.application.config.summer_quizzes.keys.sample
    redirect_to action: :show_summer, id: quiz_id
  end

  def generate_emojis
    emojies = %w[😀 😃 😄 😁 😆 😅 😂 🤣 🥲 🥹 ☺️ 😊 😇 🙂 🙃 😉 😌 😍 🥰 😘 😗 😙 😚 😋 😛 😝 😜 🤪 🤨 🧐 🤓 😎 🥸 🤩 🥳 😏 😒 😞 😔 😟 😕 🙁 ☹️ 😣 😖 😫 😩 🥺 😢 😭 😮‍💨 😤 😠 😡 🤬 🤯 😳 🥵 🥶 😱 😨 😰 😥 😓 🫣 🤗 🫡 🤔 🫢 🤭 🤫 🤥 😶 😶‍🌫️ 😐 😑 😬 🫠 🙄 😯 😦 😧 😮 😲 🥱 😴 🤤 😪 😵 😵‍💫 🫥 🤐 🥴 🤢 🤮 🤧 😷 🤒 🤕 🤑 🤠 😈 👿 👹 👺 🤡 💩 👻]
    emojies.shuffle!
    emojies[0..4]
  end
end
