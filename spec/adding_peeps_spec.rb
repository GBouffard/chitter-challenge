require 'spec_helper'

feature 'User adds a new peep' do
  scenario 'Seeing the message box when clicking New Peep' do
    visit '/'
    click_link('New Peep')
    expect(current_path).to eq('/peeps/new')
    expect(page).to have_content('Message:')
  end

  scenario 'posting a new peep' do
    visit '/'
    click_link('New Peep')
    fill_in 'message', with: 'Hello Chitter'
    click_button 'Post Peep'
    peep = Peep.first
    expect(peep.message).to eq('Hello Chitter')
  end
end
