module CommentsHelper
  def comments_creation
    User.create(username: 'GBouffard',
                email: 'guillaume@bouffard.com',
                password: 'password',
                password_confirmation: 'password')
    guillaume = User.first
    Peep.create(message: 'comment that peep!',
                user_id: guillaume.id,
                date_time: DateTime.now)
    peep = Peep.first
    Comment.create(message: 'nice peep!',
                   user_id: guillaume.id,
                   peep_id: peep.id,
                   date_time: DateTime.now)
    Comment.create(message: 'I love it!',
                   user_id: guillaume.id,
                   peep_id: peep.id,
                   date_time: DateTime.now)
    visit '/'
  end

  def add_comment(message)
    sign_up
    sign_in
    visit '/'
    click_link('New Peep')
    fill_in 'message', with: 'peep to comment'
    click_button 'Post Peep'
    visit '/'
    click_link('See comments')
    click_link('New Comment')
    fill_in 'message', with: message
    click_button 'Post Comment'
    visit '/'
  end
end
