require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  # describe "GET index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "POST create" do
  	it "user should create questions" do
  		post :create, question: {title: 'some text', description: 'some more text'}
  		expect(Question.count).to  eq(1)
  	end
  end

end
