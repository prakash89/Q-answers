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
    @question.user_id = current_user.id
  	if @question.save
      redirect_to category_path(id: @question.category)
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def upvote
    @question = Question.find(params[:id])
    @question.liked_by current_user
    redirect_to @question
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote_from current_user
    redirect_to @question
  end

  private

  def category_params
    @category = params[:category_id]
  end

  def questions_params
    params.require(:question).permit(:title, :description)
  end
end
