require 'spec_helper'
require 'tilt/erb'
require_relative 'helpers/user_signs'
include UserSigns
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
