class WordsController < ApplicationController
  def index
    words = Word.random

    words_to_exclude = params[:exclude_words] || []
    unless words_to_exclude.empty?
      words = words.excluding(words_to_exclude)
    end
    words = words.limit(2)

    render :json => words
  end
end
