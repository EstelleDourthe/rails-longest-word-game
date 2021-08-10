require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.shuffle[0..10]
  end

  def english_word
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    letters = JSON.parse(open(url).read)
  end

  def score
    @answer = params[:new].chars
    @letters = params[:letters].split
    if @answer.include?(@letters)
      "Sorry, but #{@answer} can’t be built out of #{@letters}."
    elsif !english_word
      "Sorry but #{@answer} does not seem to be an English word."
    else
      "Congratulation! #{@answer} is a valid English word."
    end
  end
end
