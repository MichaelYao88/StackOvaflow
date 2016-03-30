class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :anwers do |t|
      t.integer  :question_id
      t.integer  :answerer_id
      t.string   :text

      t.timestamps(null:false)
    end
  end
end
