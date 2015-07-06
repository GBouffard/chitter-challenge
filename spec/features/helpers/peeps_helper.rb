module PeepsHelper
  def peep_creation
    user_creation
    Peep.create(message: 'peep peep peep',
                user_id: User.first.id,
                date_time: DateTime.now)
  end

  def second_peep_creation
    Peep.create(message: 'moo!',
                user_id: User.first.id,
                date_time: DateTime.now)
    visit '/'
  end

  def add_peep(message)
    sign_up
    sign_in
    visit '/'
    click_link('New Peep')
    fill_in 'message', with: message
    click_button 'Post Peep'
  end

  def update_peep(message)
    fill_in 'message', with: message
    click_button 'Update'
  end
end
