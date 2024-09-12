class CreateIntegrations < ActiveRecord::Migration[7.2]
  def change
    create_table :integrations do |t|
      t.references :user, foreign_key: true, index: false, null: false
      t.string :name, null: false
      t.string :token, null: false
      t.timestamps

      t.index [:user_id, :name], unique: true
    end
  end
end
