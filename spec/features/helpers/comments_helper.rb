module CommentsHelper
  def comment_creation
    peep_creation
    Comment.create(message: 'nice peep!',
                   user_id: User.first.id,
                   peep_id: Peep.first.id,
                   date_time: DateTime.now)
  end

  def second_comment_creation
    Comment.create(message: 'I love it!',
                   user_id: User.first.id,
                   peep_id: Peep.first.id,
                   date_time: DateTime.now)
    visit '/'
  end

  def add_comment(message)
    add_peep('peep to comment')
    visit '/'
    click_link('See comments')
    click_link('New Comment')
    fill_in 'message', with: message
    click_button 'Post Comment'
    visit '/'
  end

  def update_comment(message)
    fill_in 'message', with: message
    click_button 'Update'
  end
end
