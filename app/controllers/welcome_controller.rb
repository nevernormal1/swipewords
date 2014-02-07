class WelcomeController < ApplicationController
  def index
    @word = Word.first
  end
end
