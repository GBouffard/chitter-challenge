require 'spec_helper'

feature 'User adds a new peep' do
  scenario 'Seeing the new peep page when clicking New Peep' do
    visit '/'
    click_link('New Peep')
    expect(current_path).to eq('/peeps/new')
    expect(page).to have_content('Message:')
  end

  scenario 'posting a new peep' do
    visit '/'
    click_link('New Peep')
    add_peep('Hello Chitter')
    peep = Peep.first
    expect(peep.message).to eq('Hello Chitter')
    expect(page).to have_content('Hello Chitter')
  end

  scenario 'deleting a peep' do
    visit '/'
    click_link('New Peep')
    add_peep('Hello Chitter')
    click_button('Delete Peep')
    expect(page).not_to have_content('Hello Chitter')
  end

  def add_peep(message)
    fill_in 'message', with: message
    click_button 'Post Peep'
  end
end
