class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer  :questioner_id
      t.string   :question_title
      t.string   :question_body
      # t.integer  :best_answer_id

      t.timestamps(null:false)
    end
  end
end
