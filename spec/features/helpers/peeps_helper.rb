module PeepsHelper
  def add_peep(message)
    sign_up
    sign_in('Guillaume@bouffard.com', 'whatever')
    visit '/'
    click_link('New Peep')
    fill_in 'message', with: message
    click_button 'Post Peep'
  end

  def update_peep(message)
    fill_in 'message', with: message
    click_button 'Update'
  end

  def peeps_creation
    User.create(email: 'guillaume@bouffard.com',
                password: 'password',
                password_confirmation: 'password')
    guillaume = User.first
    Peep.create(message: 'peep peep peep', user_id: guillaume.id, date_time: DateTime.now)
    Peep.create(message: 'moo!', user_id: guillaume.id, date_time: DateTime.now)
    visit '/'
  end
end
