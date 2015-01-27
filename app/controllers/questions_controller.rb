class QuestionsController < ApplicationController

  def index
    @catagory = params[:catagory]
    @questions = Question.all
  end

  def new
    @catagory = params[:catagory]
    @question = Question.new
  end

  def create
  	@catagory = params[:catagory]
  	@question = Question.new(questions_params)
  	@question.category = @catagory
  	@question.save
  	redirect_to questions_index_path
  end

  private

  def questions_params
  	params.require(:question).permit(:title, :description)
  end

end
