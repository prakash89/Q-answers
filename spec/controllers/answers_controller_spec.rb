require 'rails_helper'

RSpec.describe AnswersController, :type => :controller do

let(:ruby) {FactoryGirl.create(:answer)}

  describe "POST create" do
    it "user should create answer" do
      post :create, category: "ruby", question_id: ruby.id, answer: {my_answer: "My Answer"}
    end
  end

end
