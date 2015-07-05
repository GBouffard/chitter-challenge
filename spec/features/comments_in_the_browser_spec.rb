require 'spec_helper'
require 'tilt/erb'
require_relative 'helpers/user_signs'
include UserSigns
require_relative 'helpers/peeps_helper'
include PeepsHelper
require_relative 'helpers/comments_helper'
include CommentsHelper

feature 'Opening a peep\'s page' do
  scenario 'seeing all the comments that have been posted on that peep' do
    comments_creation
    click_link 'See comments'
    expect(page).to have_content('nice peep!')
    expect(page).to have_content('I love it!')
  end
end

feature 'Comment management' do
  before(:each) do
    add_comment('This is a comment!')
    visit '/'
    click_link('See comments')
  end

  scenario 'the user is redirected to a form when clicking new comment' do
    click_link('New Comment')
    expect(current_path).to eq('/comments/5/new')
    expect(page).to have_content('Message:')
  end

  scenario 'the comment appears on the peep page when posted' do
    expect(page).to have_content('This is a comment!')
  end

  scenario 'an empty comment cannot be posted' do
    click_link('New Comment')
    click_button 'Post Comment'
    expect(current_path).to eq('/comments/7/new')
    expect(page).to have_content('You cannot post an empty comment!')
  end

  scenario 'a comment that contains more than 140 characters cannot be posted' do
    click_link('New Comment')
    fill_in 'message', with: 'This is a very long message that definitely contains more than 140 characters because that\'s what I need for this test. It has 141 characters'
    click_button 'Post Comment'
    expect(current_path).to eq('/comments/8/new')
    expect(page).to have_content('Comments are limited to 140 characters!')
  end

  scenario 'an existing comment can be deleted' do
    click_button('Delete Comment')
    expect(page).not_to have_content('This is a comment!')
  end

  scenario 'an existing comment can be updated' do
    click_link('Update Comment')
    update_comment('Haha! I just changed that!')
    expect(page).not_to have_content('This is a comment!')
    expect(page).to have_content('Haha! I just changed that!')
  end

  scenario 'an existing comment cannot be updated to an empty comment' do
    click_link('Update Comment')
    update_peep('')
    expect(page).to have_content('You cannot update to an empty comment!')
  end

  scenario 'an existing comment cannot be updated to a comment that contains more than 140 characters' do
    click_link('Update Comment')
    update_peep('This is a very long message that definitely contains more than 140 characters because that\'s what I need for this test. It has 141 characters')
    expect(page).to have_content('Comments are limited to 140 characters!')
  end
end
