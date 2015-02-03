require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}
  let(:question) {FactoryGirl.create(:question)}
  let(:question1) {FactoryGirl.create(:question)}

  before(:each) do
    sign_in(user)
  end

  describe "POST create" do
    it "user should create questions" do
      expect do 
        post :create, category_id: "ruby", question: {title: 'some text', description: 'some more text'}
      end.to change(Question,:count).by(1)
    end
  end

  describe "GET show" do
    it "user should view the question" do
      get :show, category: "ruby", user_id: user.id, id: question1.id
      expect(assigns[:question]).to eq(question1)
    end
  end

  describe "GET edit" do
    it "user should edit the question" do
      get :edit, category: "ruby", id: question.id
      expect(assigns[:question]).to eq(question)
    end
  end

  describe "PUT update" do
    it "user should update the question" do
      put :update, category: "ruby", id: question.id, question: {title: 'some text', description: 'some more text'}
      expect(assigns[:question]).to eq(question)
    end
  end

  describe "PUT upvote" do
    it "user should vote to the question" do
      expect do
        put :upvote, category: "ruby", user_id: user.id, id: question.id
      end.to change(question.get_upvotes, :count).by(1)
    end
  end

  describe "PUT downvote" do
    it "user should down vote to the question" do
      expect do
        put :downvote, category: "ruby", user_id: user.id, id: question.id
      end.to change(question.get_downvotes, :count).by(1)
    end
  end

end
