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

feature "Check fields in create questions page" do
     scenario "user should see 'title' and 'discription' text fields in create questions page" do
        visit "/questions/:category"
        click_button "Ask Question"
        expect(page).to have_text("Title")
        expect(page).to have_text("Description")
     end

     scenario "user should see 'Post Your Question' button in create questions page" do
        visit "/questions/:category"
        click_button "Ask Question"
        expect(page).to have_button("Post Your Question")
     end
end

feature "create question in create question page" do 

  scenario "user should create question in create question page" do
    visit "/questions/:category/new"
    fill_in "Title", :with => "some text"
    fill_in "Description", :with => "some more text"
    click_button "Post Your Question"
    expect(page).to have_text("some text")
  end
end

end