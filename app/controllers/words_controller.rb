class WordsController < ApplicationController
  def index
    words = Word.random.limit(2)

    render :json => words
  end
end
