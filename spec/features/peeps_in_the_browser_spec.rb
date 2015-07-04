require 'spec_helper'
require 'tilt/erb'
require_relative 'helpers/user_signs'
include UserSigns
require_relative 'helpers/peeps_helper'
include PeepsHelper

feature 'opening Chitter\'s home page' do
  scenario 'seeing all the peeps that have been posted' do
    peeps_creation
    expect(page).to have_content('peep peep peep')
    expect(page).to have_content('moo!')
  end
end

feature 'peep management' do
  before(:each) do
    add_peep('Hello Chitter')
  end

  scenario 'the user is redirected to a form when clicking new peep' do
    visit '/'
    click_link('New Peep')
    expect(current_path).to eq('/peeps/new')
    expect(page).to have_content('Message:')
  end

  scenario 'the peep appears on the home page when posted' do
    expect(page).to have_content('Hello Chitter')
  end

  scenario 'an existing peep can be deleted' do
    click_button('Delete Peep')
    expect(page).not_to have_content('Hello Chitter')
  end

  scenario 'an existing peep can be updated' do
    click_link('Update Peep')
    update_peep('bye bye Chitter')
    expect(page).not_to have_content('Hello Chitter')
    expect(page).to have_content('bye bye Chitter')
  end
end
