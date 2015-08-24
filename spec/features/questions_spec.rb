require_relative '../spec_helper'
require_relative '../rails_helper'

feature "visiting create questions page" do
  let(:user) {FactoryGirl.create(:user)}
  
  scenario "user should see 'your question' text in create questions page" do
    apllication_signin
    visit "/categories/ruby"
    click_link "Ask Question"
    # expect(page).to have_text("Your Question")
  end
end

feature "create question in create question page" do 
  let(:user) {FactoryGirl.create(:user)}
  let(:question) {FactoryGirl.create(:question, category: "ruby")}
  before(:each) { apllication_signin }

  scenario "user should create question in create question page" do
    question
    visit "/categories/ruby"
    click_link "Ask Question"
    # expect(page).to have_text("Your Question")
    # fill_in "Title", :with => "some text"
    # fill_in "Description", :with => "some more text"
    # click_button "Post Your Question"
    # expect(page).to have_text("some text")
  end

  scenario "user should edit question in edit question page" do
    question
    visit "/categories/ruby"
    click_link "some text"
    expect(page).to have_link("Edit Question")
    click_link("Edit Question")
    # expect(page).to have_text("Title")
    # expect(page).to have_text("Description")
    # fill_in "Title", :with => "some one text"
    # fill_in "Description", :with => "some one more text"
    # click_button "Update Your Question"
    # expect(page).to have_text("some one text")
  end

  scenario "user should view question in view question page" do
    question
    visit "/categories/ruby"
    click_link "some text"
    expect(page).to have_link("Edit Question")
    expect(page).to have_text("some text")
    expect(page).to have_text("some more text")
    expect(page).to have_link("Share Your Answer")
  end
end

feature "Like or Dislike the questions" do
  let(:user) {FactoryGirl.create(:user)}
  let(:question) {FactoryGirl.create(:question, category: "ruby")}
  before(:each) { apllication_signin }

  scenario "user should able to like question" do
    question
    visit "/categories/ruby"
    click_link "some text"
    expect(page).to have_link("question_like_button")
    click_link "question_like_button"
    expect(question.get_upvotes.size).to eq(1)
  end

  scenario "user should able to unlike question" do
    question
    visit "/categories/ruby"
    click_link "some text"
    expect(page).to have_link("question_unlike_button")
    click_link "question_unlike_button"
    expect(question.get_downvotes.size).to eq(1)
  end
end

feature "comment to questions" do
  let(:user) {FactoryGirl.create(:user)}
  let(:question) {FactoryGirl.create(:question, category: "ruby")}
  before(:each) { apllication_signin }

  scenario "user should able to comment a question" do
    question
    visit "/categories/ruby"
    click_link "some text"
    expect(page).to have_link("add a comment")
  end
end

