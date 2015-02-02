require_relative '../spec_helper'
require_relative '../rails_helper'

feature "User authentication" do
	let(:user) {FactoryGirl.create(:user)}
	
	scenario "Create new user for Q-A apllication" do
		visit "/"
		click_link "Sign Up"
		expect(page).to have_text("Sign up")
		fill_in "user_email", :with => "example1@yopmail.com"
		fill_in "user_password", :with => "123456789"
		fill_in "user_password_confirmation", :with => "123456789"
		click_button "Sign up"
		expect(page).to have_text("Welcome to Q&A")
	end

	scenario "Create new user for existing email" do
		visit "/"
		click_link "Sign Up"
		expect(page).to have_text("Sign up")
		fill_in "user_email", :with => user.email
		fill_in "user_password", :with => user.password
		fill_in "user_password_confirmation", :with => user.password
		click_button "Sign up"
		expect(page).to have_text("Email has already been taken")
	end

	scenario "User should able to log in with valid credentials" do
	  visit "/"
    click_link "Log In"
    expect(page).to have_text("Log in")
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    click_button "Log in"
    expect(page).to have_text("Welcome to Q&A")
	end

	scenario "User should able to log in with invalid credentials" do
	  visit "/"
    click_link "Log In"
    expect(page).to have_text("Log in")
    fill_in "user_email", :with => "example2@yopmail.com"
    fill_in "user_password", :with => "12345"
    click_button "Log in"
    expect(page).to have_text("Log in")
	end

	scenario "User should able to log out" do
		visit "/"
    click_link "Log In"
    expect(page).to have_text("Log in")
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    click_button "Log in"
    expect(page).to have_link("logout")
		click_link("logout")
		expect(page).to have_text("Welcome Q-Answers")
	end
end