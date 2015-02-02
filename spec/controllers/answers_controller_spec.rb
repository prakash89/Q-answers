require 'rails_helper'

RSpec.describe AnswersController, :type => :controller do

let(:user) {FactoryGirl.create(:user)}
let(:answer) {FactoryGirl.create(:answer)}
let(:question) {FactoryGirl.create(:question)}

before(:each) do
   sign_in(user)
end

  describe "POST create" do
    it "user should create answer" do
      expect do
        post :create, category: "ruby", user_id: user.id, question_id: question.id, answer: {my_answer: "My Answer"}
      end.to change(Answer, :count).by(1)
    end
  end

end
