class AnswersController < ApplicationController

    before_action :category_params
	
	def new
        @question_id = params[:question_id]
        @answer = Answer.new
    end
    
    def create
        @question_id = params[:question_id]
        @answer = Answer.new(answer_params)
        @answer.question_id = @question_id
        @answer.category = @category
        if @answer.save
            redirect_to questions_show_path(@category, @question_id)
        else
            render 'new'
        end
    end

    def category_params
        @category = params[:category]
    end

    private

    def answer_params
    	params.require(:answer).permit(:my_answer, :question_id, :category)
    end
end
