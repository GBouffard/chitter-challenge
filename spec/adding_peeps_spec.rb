require 'spec_helper'

feature 'User clicks on new peep' do
  scenario 'Being redirected to the new peep page' do
    visit '/'
    click_link('New Peep')
    expect(current_path).to eq('/peeps/new')
    expect(page).to have_content('Message:')
  end
end

feature 'User adds a new peep' do
  before(:each) do
    visit '/'
    click_link('New Peep')
    add_peep('Hello Chitter')
  end

  scenario 'posting a new peep on the home page' do
    expect(page).to have_content('Hello Chitter')
  end

  scenario 'deleting an existing peep' do
    click_button('Delete Peep')
    expect(page).not_to have_content('Hello Chitter')
  end

  scenario 'updating an existing peep' do
    click_link('Update Peep')
    update_peep('bye bye Chitter')
    expect(page).not_to have_content('Hello Chitter')
    expect(page).to have_content('bye bye Chitter')
  end

  def add_peep(message)
    fill_in 'message', with: message
    click_button 'Post Peep'
  end

  def update_peep(message)
    fill_in 'message', with: message
    click_button 'Update'
  end
end
