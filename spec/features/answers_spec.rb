require_relative '../spec_helper'
require_relative '../rails_helper'


feature "Create answer in create answer page" do

let(:user) {FactoryGirl.create(:user)}	
let(:question) {FactoryGirl.create(:question, category: "ruby")}
let(:answer) {FactoryGirl.create(:answer, question_id: question.id)}
before(:each) { apllication_signin }

	scenario "user should create answer" do
		question
		visit "/categories/ruby" 
		click_link "some text"
		expect(page).to have_link("Share Your Answer")
		click_link("Share Your Answer")
		expect(page).to have_text("Your Answer")
	end

	scenario "user should edit answer in edit answer page" do
		question
    answer
    visit "/categories/ruby"
    click_link "some text"
		expect(page).to have_link("Edit Answer")
		click_link("Edit Answer")
		expect(page).to have_text("My answer")
		fill_in "My answer", :with => "My New Answer"
		click_button("Update Your Answer")
		expect(page).to have_text("My New Answer")
  end
end

feature "Like or Dislike the answer" do
  let(:user) {FactoryGirl.create(:user)}
  let(:question) {FactoryGirl.create(:question, category: "ruby")}
  let(:answer) {FactoryGirl.create(:answer, question_id: question.id)}
  before(:each) { apllication_signin }

  scenario "user should able to like answer" do
    question
    answer
    visit "/categories/ruby"
    click_link "some text"
    expect(page).to have_link("answer_unlike_button")
    click_link "answer_like_button"
    expect(answer.get_upvotes.size).to eq(1)
  end

  scenario "user should able to unlike answer" do
    question
    answer
    visit "/categories/ruby"
    click_link "some text"
    expect(page).to have_link("answer_unlike_button")
    click_link "answer_unlike_button"
    expect(answer.get_downvotes.size).to eq(1)
  end
end

feature "comment to answers" do
  let(:user) {FactoryGirl.create(:user)}
  let(:question) {FactoryGirl.create(:question, category: "ruby")}
  let(:answer) {FactoryGirl.create(:answer, question_id: question.id)}
  before(:each) { apllication_signin }

  scenario "user should able to comment a answer" do
    question
    visit "/categories/ruby"
    click_link "some text"
    expect(page).to have_link("add a comment")
  end
end