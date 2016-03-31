class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer  :question_id
      t.integer  :answerer_id
      t.string   :text
      t.boolean  :best_answer

      t.timestamps(null:false)
    end
  end
end
# CHANGE ANWER TO ANSWERS
