class Comment < ActiveRecord::Base
  validates :text, presence: true

  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: 'User'
  has_many :votes, as: :votable
end
