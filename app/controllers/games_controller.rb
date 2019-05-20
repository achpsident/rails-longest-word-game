# start of file
require 'open-uri'
require 'json'


# filler comment
class GamesController < ApplicationController
  LEWAGON_URL = "https://wagon-dictionary.herokuapp.com/"

  def new
    alphabet = ("a".."z").to_a
    grid_array = []
    (grid_array << alphabet.sample) until grid_array.length >= 9
    @letters = grid_array
  end

  def score
    raise
    guess = params(:guess)
    letters = params(:letters)
    @response = "not word" if not_word(guess)
    if word_in_grid?(guess, letters)
      @response ="a word}"
    else
      @response ="not in grid"
    end



    @response =
  end

  private



  def check_if_a_word(word)
    response = open("#{LEWAGON_URL}#{word}").read
    response["error"]
  end

  def word_in_grid?(attempt, grid)
    # grid2 = grid.clone
    letters= attempt.split(" ")
    letters.each do |char|
      new_array.delete_at(new_array.find_index(char)) if new_array.find_index(char)
    end
    new_array.empty?
  end


end
