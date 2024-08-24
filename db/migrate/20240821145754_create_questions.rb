class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, default: "", null: false
      t.text :content, default: "", null: false
      t.datetime :solved_at

      t.timestamps
    end
  end
end
