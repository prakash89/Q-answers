require_relative '../spec_helper'
require_relative '../rails_helper'


feature "Create answer in create answer page" do

let(:user) {FactoryGirl.create(:user)}	
let(:answer) {FactoryGirl.create(:answer)}
let(:question) {FactoryGirl.create(:question, category: "ruby")}
before(:each) { apllication_signin }

	scenario "user should create answer" do
		question
		visit "/questions/ruby"
		click_link "some text"
		expect(page).to have_link("Share Your Answer")
		click_link("Share Your Answer")
		expect(page).to have_text("Post Answer Here")
		expect(page).to have_text("My answer")
		fill_in "My answer", :with => "My Answer"
		click_button("Post Your Answer")
		expect(page).to have_text("My Answer")
	end

	scenario "user should edit answer in edit answer page" do
		question
    answer
    visit "/questions/ruby"
    click_link "some text"
    expect(page).to have_link("Share Your Answer")
		click_link("Share Your Answer")
		expect(page).to have_text("Post Answer Here")
		expect(page).to have_text("My answer")
		fill_in "My answer", :with => "My Answer"
		click_button("Post Your Answer")
		expect(page).to have_link("Edit Answer")
		click_link("Edit Answer")
		expect(page).to have_text("My answer")
		fill_in "My answer", :with => "My New Answer"
		click_button("Update Your Answer")
		expect(page).to have_text("My New Answer")
  end
end
