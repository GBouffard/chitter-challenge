require 'spec_helper'
require 'tilt/erb'
require_relative 'helpers/peeps_helper'
include PeepsHelper

feature 'Opening Chitter\'s home page' do
  scenario 'seeing all the peeps that have been posted' do
    peep_creation
    second_peep_creation
    expect(page).to have_content('peep peep peep')
    expect(page).to have_content('moo!')
  end
end

feature 'Peep management' do
  before(:each) do
    add_peep('Hello Chitter')
    visit '/'
  end

  scenario 'the user is redirected to a form when clicking new peep' do
    click_link('New Peep')
    expect(current_path).to eq('/peeps/new')
    expect(page).to have_content('Message:')
  end

  scenario 'the peep appears on the home page when posted' do
    expect(page).to have_content('Hello Chitter')
  end

  scenario 'an empty peep cannot be posted' do
    click_link('New Peep')
    click_button 'Post Peep'
    expect(current_path).to eq('/peeps/new')
    expect(page).to have_content('You cannot post an empty peep!')
  end

  scenario 'a peep that contains more than 140 characters cannot be posted' do
    click_link('New Peep')
    fill_in 'message', with: 'This is a very long message that definitely contains more than 140 characters because that\'s what I need for this test. It has 141 characters'
    click_button 'Post Peep'
    expect(current_path).to eq('/peeps/new')
    expect(page).to have_content('Peeps are limited to 140 characters!')
  end

  scenario 'an existing peep can be deleted' do
    click_button('Delete Peep')
    expect(page).not_to have_content('Hello Chitter')
  end

  scenario 'an existing peep can be updated' do
    expect(page.body).to include('Update Peep')
    click_link('Update Peep')
    update_peep('bye bye Chitter')
    expect(page).not_to have_content('Hello Chitter')
    expect(page).to have_content('bye bye Chitter')
  end

  scenario 'an existing peep cannot be updated to an empty peep' do
    click_link('Update Peep')
    update_peep('')
    expect(page).to have_content('You cannot update to an empty peep!')
  end

  scenario 'an existing peep cannot be updated to a peep that contains more than 140 characters' do
    click_link('Update Peep')
    update_peep('This is a very long message that definitely contains more than 140 characters because that\'s what I need for this test. It has 141 characters')
    expect(page).to have_content('Peeps are limited to 140 characters!')
  end

  scenario 'only the owner of a peep can update or delete that peep' do
    user1_logs_out_user2_signs_in
    visit '/'
    expect(page.body).not_to include('Update Peep')
  end
end
