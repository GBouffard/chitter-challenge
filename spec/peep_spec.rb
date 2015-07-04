require 'spec_helper'

describe Peep do
  before(:each) do
    User.create(email: 'guillaume@bouffard.com',
                password: 'password',
                password_confirmation: 'password')
    guillaume = User.first
    Peep.create(message: 'peep test', user_id: guillaume.id)
  end

  it 'can be added in the database' do
    expect(Peep.count).to eq(1)
    expect(Peep.first.message).to eq('peep test')
  end

  it 'can be deleted from the database' do
    Peep.first.destroy
    expect(Peep.count).to eq(0)
  end

  it 'can be updated in the database' do
    Peep.first.update(message: 'this is an updated peep')
    expect(Peep.first.message).to eq('this is an updated peep')
  end
end
