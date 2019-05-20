# start of file
require 'open-uri'
require 'json'


# filler comment
class GamesController < ApplicationController
  LEWAGON_URL = "https://wagon-dictionary.herokuapp.com/"

  def new
    session[:high_score] = 0 unless session[:high_score]
    alphabet = ("a".."z").to_a
    grid_array = []
    (grid_array << alphabet.sample) until grid_array.length >= 9
    @letters = grid_array
  end

  def score
    # raise
    @guess = params[:guess]
    @letters = params[:letters]
    @response = "not word" if not_word?(@guess)
    if word_in_grid?(@guess, @letters)
      @response = "a word"
    else
      @response = "not in grid"
    end
   # raise
  end

  private

  def not_word?(word)
    response = open("#{LEWAGON_URL}#{word}").read
    response["error"]
  end

  def word_in_grid?(attempt, grid)
    letters = attempt.split("")
    grid.split(" ").each do |char|
      letters.delete_at(letters.find_index(char)) if letters.find_index(char)
    end
    letters.empty?
  end


end
