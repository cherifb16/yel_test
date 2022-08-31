require 'rails_helper'
RSpec.describe 'User management function', type: :system do
describe 'Sign_up users function' do
    context 'When user create a patient' do
    it 'User Should Sign_up for patient crate page' do
    visit new_user_registration_path
    fill_in 'user[email]', with: 'user@gmail.com'
    fill_in 'user[password]', with: 'password1'
    fill_in 'user[password_confirmation]',  with: 'password1'
    click_button 'Create User'
  end
end
end
describe 'Session functionality test' do
    before do
      User.create(email: 'test1@gmail.com',
                  password: 'password',
                  password_confirmation: 'password')
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'Log in'
      @user = User.first
    end
    context 'to be able to login' do
      it 'enables login' do
        
      end
    end
    
  end
end