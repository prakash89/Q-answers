class QuestionsController < ApplicationController

  def index
    @catagory = params[:catagory]
  end

  def new
    @catagory = params[:catagory]
  end

end
