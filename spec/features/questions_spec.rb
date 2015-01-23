require_relative '../spec_helper'
require_relative '../rails_helper'

feature "visiting create questions page" do
    
    scenario "user should see 'ask questions here' text in create questions page" do
       visit "/questions/:catagory"
       click_button "Ask Question"
       expect(page).to have_text("Ask Questions Here")
    end
end

feature "visiting back to questions page" do

    scenario "user should see 'back' link in create questions page" do
       visit "/questions/Ruby/new"
       click_button "Back"
       expect(page).to have_text("Ruby Questions")
    end

    scenario "user should see 'back' link in create questions page" do
       visit "/questions/Rails/new"
       click_button "Back"
       expect(page).to have_text("Rails Questions")
    end

    scenario "user should see 'back' link in create questions page" do
       visit "/questions/Html&Css/new"
       click_button "Back"
       expect(page).to have_text("Html&Css Questions")
    end

    scenario "user should see 'back' link in create questions page" do
       visit "/questions/Javascript&Jquery/new"
       click_button "Back"
       expect(page).to have_text("Javascript&Jquery Questions")
    end

    scenario "user should see 'back' link in create questions page" do
       visit "/questions/Devops/new"
       click_button "Back"
       expect(page).to have_text("Devops Questions")
    end

    scenario "user should see 'back' link in create questions page" do
       visit "/questions/Testing/new"
       click_button "Back"
       expect(page).to have_text("Testing Questions")
    end

end