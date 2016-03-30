require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :name, presence: true
  validate :validate_password

  has_many :votes, foreign_key: :voter_id
  has_many :comments, foreign_key: :commenter_id
  has_many :questions, foreign_key: :questioner_id
  has_many :answers, foreign_key: :answerer_id

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @plain_text = new_password
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(name, password)
    user = User.find_by(name: name)
    return user if user && user.password == password
  end

  def validate_password
    if @plain_text.nil?
      @errors.add(:password, "password can't be blank")
    elsif @plain_text.length < 6
      @errors.add(:password, "must be longer than 6 characters")
    end
  end
end
