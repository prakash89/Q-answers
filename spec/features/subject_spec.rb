require_relative '../spec_helper'
require_relative '../rails_helper'

feature "visiting home page" do
	before(:each) { visit "/" }

	scenario "User should see the title" do 
		expect(page).to have_text("Welcome to Q&A")
	end

	scenario "User should see the subject image links" do 
		expect(page).to have_xpath("//a/img[@alt='Ruby' and @src = '/assets/ruby.jpeg']")
		expect(page).to have_xpath("//a/img[@alt='Rails' and @src = '/assets/rails.jpg']")
		expect(page).to have_xpath("//a/img[@alt='Jquery' and @src = '/assets/jquery.jpeg']")
		expect(page).to have_xpath("//a/img[@alt='Html css' and @src = '/assets/html_css.jpg']")
		expect(page).to have_xpath("//a/img[@alt='Testing' and @src = '/assets/testing.jpg']")
		expect(page).to have_xpath("//a/img[@alt='Devops' and @src = '/assets/devops.jpg']")
	end
end

feature "checking text in questions page" do
    before(:each) { visit "/" }
    
    scenario "User should see the title in ruby questions page" do
    	click_link "ruby_redirection", href: '/questions/ruby'
        expect(page).to have_text("Ruby Questions")
    end

    scenario "User should see the title in rails questions page" do
    	click_link "rails_redirection", href: '/questions/rails'
        expect(page).to have_text("Rails Questions")
    end

    scenario "User should see the title in html questions page" do
    	click_link "html_redirection",href: '/questions/html&css'
        expect(page).to have_text("Html&Css Questions")
    end

    scenario "User should see the title in jquery questions page" do
    	click_link "jquery_redirection", href: '/questions/javascript&jquery'
        expect(page).to have_text("Javascript&Jquery Questions")
    end

    scenario "User should see the title in devops questions page" do
    	click_link "devops_redirection", href: '/questions/devops'
        expect(page).to have_text("Devops Questions")
    end

    scenario "User should see the title in testing questions page" do
    	click_link "testing_redirection", href: '/questions/testing'
        expect(page).to have_text("Testing Questions")
    end
end

feature "checking ask question link in question page" do
    before(:each) { visit "/" }
    after(:each) {expect(page).to have_button("Ask Question")}

   scenario "User should see the ask question link in ruby questions page" do
        click_link "ruby_redirection"
    end

     scenario "User should see the ask question link in rails questions page" do
        click_link "rails_redirection"
    end

    scenario "User should see the ask question link in html questions page" do
        click_link "html_redirection"
    end

    scenario "User should see the ask question link in jquery questions page" do
        click_link "jquery_redirection"
    end

    scenario "User should see the ask question link in devops questions page" do
        click_link "devops_redirection"
    end

    scenario "User should see the ask question link in testing questions page" do
        click_link "testing_redirection"
    end
end
 
feature "Go back to the home page" do
   
   scenario "user should see text 'Welcome to Q&A' when come back fron questions page" do
      visit "questions/:category"
      click_button "Back"
      expect(page).to have_text("Welcome to Q&A")
  end
end

# feature "Titalize the category" do

#     scenario "user should see text 'Ruby Questions' when follow ruby image link" do
#         visit "/"
#         click_link "ruby_redirection", href: '/questions/ruby'
#         expect(page).to have_text("Ruby Questions")
#     end
# end