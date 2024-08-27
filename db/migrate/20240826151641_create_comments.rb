class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :commentable, polymorphic: true, null: false
      t.text :content, default: "", null: false
      t.timestamps
    end
  end
end
