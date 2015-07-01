require 'spec_helper'

describe Peep do
  it 'can be added in the database' do
    expect(Peep.count).to eq(0)
    Peep.create(message: 'peep test')
    expect(Peep.count).to eq(1)
    expect(Peep.first.message).to eq('peep test')
  end

  it 'can be deleted from the database' do
    Peep.create(message: 'peep test')
    Peep.first.destroy
    expect(Peep.count).to eq(0)
  end
end
