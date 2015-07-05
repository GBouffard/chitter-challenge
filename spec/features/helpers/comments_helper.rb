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
end
