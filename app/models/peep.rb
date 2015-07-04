class Peep
  include DataMapper::Resource
  property :id, Serial
  property :message, Text
  property :date, DateTime
  belongs_to :user
end
