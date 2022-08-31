require 'rails_helper'

RSpec.describe "Users", type: :system do

  before do
    driven_by(:rack_test)
  end

  def user_login
    visit new_session_path
    fill_in "Email", with: "user_system@test.com"
    fill_in "Password", with: "password"
    click_button "Log in"
  end

  describe "User registration test" do
		it "is able to newly register a user" do
			visit new_user_path
			fill_in "Email", with: "test_email@example.com"
			fill_in "Password", with: "password"
			fill_in "Password confirmation", with: "password"
      click_on "Create User"
			expect(page).to have_content "test_name"
		end

    context "When the user tries to jump to the product list screen without logging in" do
			it "transition to the login screen" do
				visit products_path
				expect(page).to have_current_path(new_session_path)
			end
		end
	end

  describe "Login function test" do
    before do
			FactoryBot.create(:user,  email: "user_system@test.com",  password: "password")
			FactoryBot.create(:user,  email: "admin_system@test.com",   password: "password")
		end

    it "Be able to log in" do
			user_login
			expect(page).to have_content "user_system@test.com"
		end
  end
end