require 'spec_helper'
require_relative 'helpers/users_helper'
include UsersHelper

feature 'A new user visiting Chitter' do
  scenario 'can sign-up with correct credentials' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello GBouffard !')
  end

  scenario 'cannot sign-up with an invalid format email' do
    expect { sign_up('user', 'not_an_email', 'password', 'password') }.to change(User, :count).by(0)
  end

  scenario 'cannot sign-up with if a password and its confirmation don\'t match' do
    expect { sign_up('user1', 'mr_wrong@wrong.com', 'password', 'wrongpass') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry! Your passwords do not match')
  end

  scenario 'cannot sign-up with a password that is less than 8 characters long' do
    expect { sign_up('user2', 'mr_right@right.com', 'short', 'short') }.to change(User, :count).by(0)
  end

  scenario 'cannot sign-up with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end
end

feature 'A registered user visiting Chitter' do
  before(:each) do
    user_creation
  end

  scenario 'can sign in with correct credentials' do
    visit '/'
    expect(page).not_to have_content('Hello GBouffard !')
    sign_in
    expect(page).to have_content('Hello GBouffard !')
  end

  scenario 'cannot sign in with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content('Hello GBouffard !')
    sign_in('GBouffard', 'wrongpassword')
    expect(page).not_to have_content('Hello GBouffard !')
  end
end

feature 'A registered user logged in on Chitter' do
  scenario 'can sign out if he/she wants to' do
    user_creation
    sign_in
    click_button 'Sign out'
    expect(page).to have_content('Good bye!')
    expect(page).not_to have_content('Hello GBouffard !')
  end
end
