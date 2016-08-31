class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text    :body, null: false
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.boolean :best_answer, default: false

      t.timestamps  null:false
    end
  end
end
