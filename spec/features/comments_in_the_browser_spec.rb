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
  end

  scenario 'the user is redirected to a form when clicking new comment' do
    click_link('See comments')
    click_link('New Comment')
    expect(current_path).to eq('/comments/5/new')
    expect(page).to have_content('Message:')
  end

  scenario 'the comment appears on the peep page when posted' do
    click_link('See comments')
    expect(page).to have_content('This is a comment!')
  end
end
