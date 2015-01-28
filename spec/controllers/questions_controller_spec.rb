require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  # describe "GET index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  let(:ruby) {FactoryGirl.create(:question)}

  describe "POST create" do
    it "user should create questions" do
      post :create, category: "ruby", question: {title: 'some text', description: 'some more text'}
  		expect(Question.count).to  eq(1)

    end
  end

  describe "GET show" do
    it "user should view the question" do
      get :show, category: "ruby", id: ruby.id
      expect(assigns[:question]).to eq(ruby)
    end
  end

end
