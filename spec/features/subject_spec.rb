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

feature "visiting questions page" do
    before(:each) { visit "/" }
    
    scenario "User should see the title in ruby questions page" do
    	click_link "ruby_redirection"
        expect(page).to have_text("Ruby Questions")
    end

    scenario "User should see the ask question button in ruby questions page" do
    	click_link "ruby_redirection"
        expect(page).to have_button("Ask Question")
    end

    scenario "User should see the title in rails questions page" do
    	click_link "rails_redirection"
        expect(page).to have_text("Rails Questions")
    end

    scenario "User should see the ask question button in rails questions page" do
    	click_link "rails_redirection"
        expect(page).to have_button("Ask Question")
    end

    scenario "User should see the title in html questions page" do
    	click_link "html_redirection"
        expect(page).to have_text("Html and Css Questions")
    end

    scenario "User should see the ask question button in html questions page" do
    	click_link "html_redirection"
        expect(page).to have_button("Ask Question")
    end

    scenario "User should see the title in jquery questions page" do
    	click_link "jquery_redirection"
        expect(page).to have_text("Javascript and Jquery Questions")
    end

    scenario "User should see the ask question button in jquery questions page" do
    	click_link "jquery_redirection"
        expect(page).to have_button("Ask Question")
    end

    scenario "User should see the title in devops questions page" do
    	click_link "devops_redirection"
        expect(page).to have_text("Devops Questions")
    end

    scenario "User should see the ask question button in devops questions page" do
    	click_link "devops_redirection"
        expect(page).to have_button("Ask Question")
    end

    scenario "User should see the title in testing questions page" do
    	click_link "testing_redirection"
        expect(page).to have_text("Testing Questions")
    end

    scenario "User should see the ask question button in testing questions page" do
    	click_link "testing_redirection"
        expect(page).to have_button("Ask Question")
    end

end