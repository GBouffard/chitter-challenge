require 'bcrypt'
class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password, message: 'Sorry! Your passwords do not match'
  validates_uniqueness_of :email, message: 'This email is already taken'
  validates_uniqueness_of :username, message: 'This username is already taken'
  validates_length_of :password, min: 8, message: 'Sorry! Your password needs to be at least 8 characters long'

  property :id, Serial
  property :username, String, unique: true, required: true
  property :email, String, unique: true, required: true, format: :email_address
  property :password_digest, Text
  has n, :peeps, constraint: :destroy
  has n, :comments,  constraint: :destroy

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end
end
