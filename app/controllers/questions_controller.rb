class QuestionsController < ApplicationController

  def index
    @catagory = params[:catagory]
  end

  def new
    @catagory = params[:catagory]
    @question = Question.new
  end

  def create
  	@question = Question.new(questions_params)
  	@question.save
  	redirect_to questions_index_path
  end

  private

  def questions_params
  	params.require(:question).permit(:title, :description)
  end

end
