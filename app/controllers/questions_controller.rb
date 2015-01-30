class QuestionsController < ApplicationController

  before_action :category_params

  def index
    @questions = Question.all.reverse
  end

  def new
    @question = Question.new
  end

  def create
  	@question = Question.new(questions_params)
  	@question.category = @category
  	if @question.valid? && @question.save
  	redirect_to questions_index_path
  else
  	render 'new'
  end
  end

  def show
  	@question = Question.find(params[:id])
    @answers = Answer.where("question_id = ?", @question.id)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      redirect_to questions_index_path
    else
      render 'edit'
    end
  end

  def category_params
    @category = params[:category]
  end

  private

  def questions_params
  	params.require(:question).permit(:title, :description)
  end

end
