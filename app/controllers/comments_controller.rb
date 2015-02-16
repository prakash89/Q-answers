class CommentsController < ApplicationController

  def new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    if @comment.save
      redirect_to question_path(@question.id)
    else
      render 'new'
    end
  end

  def create_answer_comment
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new(comment_params)
    if @comment.save
      redirect_to question_path(@question.id)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_name, :question_id, :answer_id)
  end
end