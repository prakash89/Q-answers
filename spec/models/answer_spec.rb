require 'rails_helper'

RSpec.describe Answer, :type => :model do
  describe "validation of my answer" do

    before(:each) do
      @a = Answer.new
    end

    it "user should validate presence my answer positive" do
      @a.my_answer = "My Answer"
      expect(@a).to be_valid
    end

    it "user should validate presence my answer negative" do
      @a.my_answer = ""
      expect(@a).to be_invalid
    end
  end  
end
