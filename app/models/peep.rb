class Peep
  include DataMapper::Resource
  property :id, Serial
  property :message, Text
  property :date_time, DateTime
  belongs_to :user
end
