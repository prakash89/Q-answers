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

  describe "GET edit" do
    it "user should edit the answer" do
      get :edit, category: 'ruby', id: answer.id, question_id: answer.question.id
      expect(assigns[:answer]).to eq(answer)
    end
  end

  describe "PUT update" do
    it "user should update the answer" do
      put :update, category: "ruby", id: answer.id, question_id: answer.question.id, answer: {my_answer: "My New Answer"}
      expect(assigns[:answer]).to eq(answer)
    end
  end

  describe "PUT upvote" do
    it "user should vote to the answer" do
      expect do
        put :upvote, category: "ruby", user_id: user.id, id: answer.id, question_id: answer.question.id
      end.to change(answer.get_upvotes, :count).by(1)
    end
  end

  describe "PUT downvote" do
    it "user should down vote to the question" do
      expect do
        put :downvote, category: "ruby", user_id: user.id, id: answer.id, question_id: answer.question.id
      end.to change(answer.get_downvotes, :count).by(1)
    end
  end

end
