require "open-uri"
class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(10)
    # @letters = ["r","i","c","u","q","e","z","y","q","i"]
  end

  def score
  @answer = ""
    # fetch("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
    # .then ((response) => response.json())
    # .then ((data) =>{
    #  veracidad = data.found
    #  longitud = data.length
    # })
    letters = params[:letters]
    letter = letters.split("")
    word = params[:word]
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    data = JSON.parse(response.read)
    veracidad = data["found"]
    longitud = data["length"]

    if veracidad == true && word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
      @answer = "Congratulations! #{word} is a valid English word"
  elsif veracidad == true
    @answer = "Sorry but TEST cant be build out of #{letters}"
    else @answer = "Sorry but #{word} does not seem to be valid English word"
    end


  end
end
