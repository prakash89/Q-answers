require_relative '../spec_helper'
require_relative '../rails_helper'

feature "visiting home page" do
	before(:each) { visit "/" }

  let(:user) {FactoryGirl.create(:user)}

	# scenario "User should see the title" do 
	# 	expect(page).to have_text("Welcome to Q&A")
	# end

	scenario "User should see the subject image links" do 
    apllication_signin
		expect(page).to have_xpath("//a/img[@alt='Ruby' and @src = '/assets/ruby.jpeg']")
		expect(page).to have_xpath("//a/img[@alt='Rails' and @src = '/assets/rails.jpg']")
		expect(page).to have_xpath("//a/img[@alt='Jquery' and @src = '/assets/jquery.jpeg']")
		expect(page).to have_xpath("//a/img[@alt='Html css' and @src = '/assets/html_css.jpg']")
		expect(page).to have_xpath("//a/img[@alt='Testing' and @src = '/assets/testing.jpg']")
		expect(page).to have_xpath("//a/img[@alt='Devops' and @src = '/assets/devops.jpg']")
	end
end

feature "checking text in questions page" do
  let(:user) {FactoryGirl.create(:user)}
  before(:each) { apllication_signin } 
   
  scenario "User should see the title in ruby questions page" do
    click_link "Ruby", href: '/categories/ruby'
    expect(page).to have_text("Ruby Questions")
  end

  scenario "User should see the title in rails questions page" do
    click_link "Rails", href: '/categories/rails'
    expect(page).to have_text("Rails Questions")
  end

  scenario "User should see the title in html questions page" do
    click_link "Html&Css",href: '/categories/html&css'
    expect(page).to have_text("Html&Css Questions")
  end

  scenario "User should see the title in jquery questions page" do
    click_link "Javascript&Jquery", href: '/categories/javascript&jquery'
    expect(page).to have_text("Javascript&Jquery Questions")
  end

  scenario "User should see the title in devops questions page" do
    click_link "Devops", href: '/categories/devops'
    expect(page).to have_text("Devops Questions")
  end

  scenario "User should see the title in testing questions page" do
    click_link "Testing", href: '/categories/testing'
    expect(page).to have_text("Testing Questions")
  end
end

feature "checking ask question link in question page" do
  let(:user) {FactoryGirl.create(:user)}
  before(:each) { apllication_signin }
  after(:each) {expect(page).to have_link("Ask Question")}

  scenario "User should see the ask question link in ruby questions page" do
    click_link "Ruby", href: '/categories/ruby'
  end

  scenario "User should see the ask question link in rails questions page" do
    click_link "Rails", href: '/categories/rails'
  end

  scenario "User should see the ask question link in html questions page" do
    click_link "Html&Css",href: '/categories/html&css'
  end

  scenario "User should see the ask question link in jquery questions page" do
    click_link "Javascript&Jquery", href: '/categories/javascript&jquery'
  end

  scenario "User should see the ask question link in devops questions page" do
    click_link "Devops", href: '/categories/devops'
  end

  scenario "User should see the ask question link in testing questions page" do
    click_link "Testing", href: '/categories/testing'
  end
end


