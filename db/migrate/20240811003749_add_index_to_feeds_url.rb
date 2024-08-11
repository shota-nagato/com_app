class AddIndexToFeedsUrl < ActiveRecord::Migration[7.1]
  def change
    add_index :feeds, :url, unique: true
  end
end
