class Question < ActiveRecord::Base
  validates :question_title, presence: true
  validates :question_body, presence: true

  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :questioner, class_name: 'User'

end
