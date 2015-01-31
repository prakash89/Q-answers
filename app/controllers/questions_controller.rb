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
  	if @question.save
      redirect_to questions_index_path
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      redirect_to questions_show_path(@category, @question.id)
    else
      render 'edit'
    end
  end

  private

  def category_params
    @category = params[:category]
  end

  def questions_params
    params.require(:question).permit(:title, :description)
  end
end
