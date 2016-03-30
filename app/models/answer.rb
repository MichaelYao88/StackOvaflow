class Answer < ActiveRecord::Base
  validates :text, presence: true

  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :answerer, class_name: 'User'
end
