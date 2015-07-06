require 'spec_helper'

describe Comment do
  before(:each) do
    User.create(username: 'GBouffard',
                email: 'guillaume@bouffard.com',
                password: 'password',
                password_confirmation: 'password')
    guillaume = User.first
    Peep.create(message: 'peep test',
                user_id: guillaume.id)
    new_peep = Peep.first
    Comment.create(message: 'comment test',
                   user_id: guillaume.id,
                   peep_id: new_peep.id)
  end

  it 'can be added in the database' do
    expect(Comment.count).to eq(1)
    expect(Comment.first.message).to eq('comment test')
  end

  it 'can be deleted from the database' do
    Comment.first.destroy
    expect(Comment.count).to eq(0)
  end

  it 'can be updated in the database' do
    Comment.first.update(message: 'this is an updated comment')
    expect(Comment.first.message).to eq('this is an updated comment')
  end

  it 'is automatically deleted if the peep it belongs to is deleted' do
    Peep.first.destroy
    expect(Comment.count).to eq(0)
  end
end
