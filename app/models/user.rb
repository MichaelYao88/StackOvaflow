class User < ActiveRecord::Base
has_many :votes, foreign_key: :voter_id
has_many :comments, foreign_key: :commenter_id
has_many :questions, foreign_key: :questioner_id
has_many :answers, foreign_key: :answerer_id
end
