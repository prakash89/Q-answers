require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}
  let(:question) {FactoryGirl.create(:question)}

  before(:each) do
    sign_in(user)
  end

  describe "POST create" do
    it "user should create questions" do
      expect do 
        post :create, category: "ruby", question: {title: 'some text', description: 'some more text'}
      end.to change(Question,:count).by(1)
    end
  end

  describe "GET show" do
    it "user should view the question" do
      expect do
        get :show, category: "ruby", user_id: user.id, id: question.id
      end.to change(Question, :count).by(1)
    end
  end

  describe "GET edit" do
    it "user should edit the question" do
      expect do
        get :edit, category: "ruby", id: question.id
      end.to change(Question, :count).by(1)
    end
  end

  describe "PUT update" do
    it "user should update the question" do
      expect do
        put :update, category: "ruby", id: question.id, question: {title: 'some text', description: 'some more text'}
      end.to change(Question, :count).by(1)
    end
  end

end
