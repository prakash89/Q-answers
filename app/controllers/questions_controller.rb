class QuestionsController < ApplicationController

  def index
    @category = params[:category]
    @questions = Question.all.reverse
  end

  def new
    @category = params[:category]
    @question = Question.new
  end

  def create
  	@category = params[:category]
  	@question = Question.new(questions_params)
  	@question.category = @category
  	if @question.valid? && @question.save
  	redirect_to questions_index_path
  else
  	render 'new'
  end
  end

  def show
  	@category = params[:category]
  	@question = Question.find(params[:id])
    @answers = Answer.where("question_id = ?", @question.id)
  end

  def edit
    @category = params[:category]
    @question = Question.find(params[:id])
  end

  def update
    @category = params[:category]
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      redirect_to questions_index_path
    else
      render 'edit'
    end
  end

  private

  def questions_params
  	params.require(:question).permit(:title, :description)
  end

end
