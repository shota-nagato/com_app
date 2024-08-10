class CreateFeeds < ActiveRecord::Migration[7.1]
  def change
    create_table :feeds do |t|
      t.string "title", null: false
      t.string "url", null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
