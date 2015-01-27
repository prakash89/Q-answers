require 'rails_helper'

RSpec.describe Question, :type => :model do

  describe "validation of title and description fields" do

  	before(:each) do
  		@q = Question.new
  	end

  	it "user should validate presence title and description positive" do
  		@q.title = "some text"
  		@q.description = "some more text"
  		expect(@q).to be_valid
  	end

  	it "user should validate presence title and description negative" do
  		@q.title = "some text"
  		@q.description = ""
  		expect(@q).to be_invalid
  	end

  	it "user should validate presence title and description negative" do
  		@q.title = ""
  		@q.description = "some more text"
  		expect(@q).to be_invalid
  	end
  end
end
