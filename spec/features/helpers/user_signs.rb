module UserSigns
  def sign_up(username = 'GBouffard',
              email = 'Guillaume@bouffard.com',
              password = 'whatever',
              password_confirmation = 'whatever')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def user_creation
    User.create(username: 'GBouffard',
                email: 'Guillaume@bouffard.com',
                password: 'whatever',
                password_confirmation: 'whatever')
  end

  def user1_logs_out_user2_signs_in
    click_button 'Sign out'
    sign_up('GBouffard', 'user2@chitter.com', 'whatever', 'whatever')
    sign_in('user2@chitter.com', 'whatever')
  end
end
