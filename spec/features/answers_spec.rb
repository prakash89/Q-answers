require_relative '../spec_helper'
require_relative '../rails_helper'


feature "Create answer in create answer page" do
	
let(:rubya) {FactoryGirl.create(:answer)}
let(:rubyq) {FactoryGirl.create(:question, category: "ruby")}

	scenario "user should see post answer here text in create answer page" do
		visit "/questions/:category/#{rubyq.id}"
		click_link "Share Your Answer"
		expect(page).to have_text("Post Answer Here")
	end

	scenario "user should see post your answer button in create answer page" do
		visit "/questions/:category/#{rubyq.id}"
		click_link "Share Your Answer"
		expect(page).to have_button("Post Your Answer")
	end

	scenario "user should create answer" do
		rubyq
		visit "/questions/ruby"
		click_link "some text"
		expect(page).to have_link("Share Your Answer")
		click_link("Share Your Answer")
		expect(page).to have_text("My answer")
		fill_in "My answer", :with => "My Answer"
		click_button("Post Your Answer")
		expect(page).to have_text("My Answer")
	end
end
