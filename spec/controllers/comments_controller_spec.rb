require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  
  let(:user) {FactoryGirl.create(:user)}
  let(:answer) {FactoryGirl.create(:answer)}
  let(:question) {FactoryGirl.create(:question)}

  before(:each) do
    sign_in(user)
  end

  describe "POST create" do
    it "user should create comment on question" do
      expect do
        post :create, category: "ruby", user_id: user.id, question_id: question.id, comment: {comment_name: "some comment"}
      end.to change(Comment, :count).by(1)
    end
  end

  describe "POST create_answer_comment" do
    it "user should create comment on answer" do
      expect do
        post :create, category: "ruby", user_id: user.id, answer_id: answer.id, question_id: question.id, comment: {comment_name: "some comment"}
      end.to change(Comment, :count).by(1)
    end
  end
end