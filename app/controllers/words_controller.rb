class WordsController < ApplicationController
  def index
    @word = Word.random.first

    render :json => {
      value: @word.value,
      prefixes: @word.prefixes,
      suffixes: @word.suffixes,
      pictureUrl: @word.picture.url(:medium)
    }
  end
end
