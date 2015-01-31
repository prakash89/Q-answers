class AnswersController < ApplicationController

  before_action :category_params

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.category = @category
    if @answer.save
      redirect_to questions_show_path(@category, @question.id)
    else
      render 'new'
    end
  end

  private

  def category_params
    @category = params[:category]
  end

  def answer_params
    params.require(:answer).permit(:my_answer, :question_id, :category)
  end
end
