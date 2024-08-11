class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.datetime :published_at, null: false
      t.references :feed, foreign_key: true, null: false

      t.timestamps
    end
    add_index :entries, :url, unique: true
  end
end
