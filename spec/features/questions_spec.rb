require_relative '../spec_helper'
require_relative '../rails_helper'

feature "visiting create questions page" do
    
  scenario "user should see 'ask questions here' text in create questions page" do
    visit "/questions/:category"
    click_button "Ask Question"
    expect(page).to have_text("Ask Questions Here")
  end
end

feature "visiting back to questions page" do

  scenario "user should see 'back' link in create questions page" do
    visit "/questions/ruby/new"
    click_button "Back"
    expect(page).to have_text("Ruby Questions")
  end

  scenario "user should see 'back' link in create questions page" do
    visit "/questions/rails/new"
    click_button "Back"
    expect(page).to have_text("Rails Questions")
  end

  scenario "user should see 'back' link in create questions page" do
    visit "/questions/html&css/new"
    click_button "Back"
    expect(page).to have_text("Html&Css Questions")
  end

  scenario "user should see 'back' link in create questions page" do
    visit "/questions/javascript&jquery/new"
    click_button "Back"
    expect(page).to have_text("Javascript&Jquery Questions")
  end

  scenario "user should see 'back' link in create questions page" do
    visit "/questions/devops/new"
    click_button "Back"
    expect(page).to have_text("Devops Questions")
  end

  scenario "user should see 'back' link in create questions page" do
    visit "/questions/testing/new"
    click_button "Back"
    expect(page).to have_text("Testing Questions")
  end
end

feature "create question in create question page" do 
let(:user) {FactoryGirl.create(:user)}
let(:question) {FactoryGirl.create(:question, category: "ruby")}
before(:each) { apllication_signin }

  scenario "user should create question in create question page" do
    question
    visit "/questions/:category"
    click_button "Ask Question"
    expect(page).to have_text("Ask Questions Here")
    fill_in "Title", :with => "some text"
    fill_in "Description", :with => "some more text"
    click_button "Post Your Question"
    expect(page).to have_text("some text")
  end

  scenario "user should edit question in edit question page" do
    question
    visit "/questions/ruby"
    click_link "some text"
    expect(page).to have_link("Edit Question")
    click_link("Edit Question")
    expect(page).to have_text("Title")
    expect(page).to have_text("Description")
    fill_in "Title", :with => "some one text"
    fill_in "Description", :with => "some one more text"
    click_button "Update Your Question"
    expect(page).to have_text("some one text")
  end

  scenario "user should view question in view question page" do
    question
    visit "/questions/ruby"
    click_link "some text"
    expect(page).to have_link("Edit Question")
    expect(page).to have_text("some text")
    expect(page).to have_text("some more text")
    expect(page).to have_link("Share Your Answer")
  end
end

