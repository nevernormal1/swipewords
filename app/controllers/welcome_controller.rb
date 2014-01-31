class WelcomeController < ApplicationController
  def index
    @word = "brick"
    @prefixes = %w(spr fr br cl)
    @suffixes = %w(ight ick oud ate)
  end
end
