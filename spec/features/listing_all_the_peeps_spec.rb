require 'spec_helper'
require 'tilt/erb'

feature 'diplsaying all the peeps' do
  before(:each) do
    Peep.create(message: 'peep peep peep')
    Peep.create(message: 'moo!')
  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('peep peep peep')
    expect(page).to have_content('moo!')
  end
end
