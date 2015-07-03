feature 'User signs up' do
  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Guillaume@bouffard.com')
  end

  scenario 'and cannot with a password confirmation that does not match' do
    expect { sign_up('mr_wrong@wrong.com', 'pass', 'wrong') }.to change(User, :count).by(0)
  end

  def sign_up(email = 'Guillaume@bouffard.com',
              password = 'whatever',
              password_confirmation = 'whatever')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
