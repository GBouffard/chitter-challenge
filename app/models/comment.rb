class Comment
  include DataMapper::Resource
  property :id, Serial
  property :message, Text
  property :date_time, DateTime
  belongs_to :peep
  belongs_to :user
end
