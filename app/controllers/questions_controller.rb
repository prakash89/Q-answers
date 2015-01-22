class QuestionsController < ApplicationController

  def index
    @catagory = params[:catagory]
  end

end
