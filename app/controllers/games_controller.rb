require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def new
    generate_letters
  end

  def score
    @letter_grid = params[:letter_grid]
    @words = params[:word]
    check = @words.split('').present? do |word|
      @letter_grid.include? word
    end
    if check
      url = "https://wagon-dictionary.herokuapp.com/#{@words}"
      user_serialized = URI.open(url).read
      user = JSON.parse(user_serialized)
      @found = user["found"]
  end
end

  private
  def generate_letters
    @letters = []
    size = 10
    size.times do
      @letters <<('A'..'Z').to_a.sample
    end
  end

end
