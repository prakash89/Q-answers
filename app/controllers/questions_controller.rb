class QuestionsController < ApplicationController

  def index
    @catagory = params[:catagory]
    @questions = Question.all.reverse
  end

  def new
    @catagory = params[:catagory]
    @question = Question.new
  end

  def create
  	@catagory = params[:catagory]
  	@question = Question.new(questions_params)
  	@question.category = @catagory
  	if @question.valid? && @question.save
  	redirect_to questions_index_path
  else
  	render 'new'
  end
  end

  private

  def questions_params
  	params.require(:question).permit(:title, :description)
  end

end
