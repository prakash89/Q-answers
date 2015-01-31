require 'rails_helper'

RSpec.describe AnswersController, :type => :controller do

let(:answer) {FactoryGirl.create(:answer)}
let(:question) {FactoryGirl.create(:question)}

  describe "POST create" do
    it "user should create answer" do
      post :create, category: "ruby", question_id: question.id, answer: {my_answer: "My Answer"}
    end
  end

end
