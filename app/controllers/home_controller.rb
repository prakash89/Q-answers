class HomeController < ApplicationController
  def index
  	@question = Question.all
  end

  def coming_soon
  end
end
