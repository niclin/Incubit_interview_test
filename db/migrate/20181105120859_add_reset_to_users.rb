class AddResetToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reset_digest, :string, unique: true
    add_column :users, :reset_sent_at, :datetime
  end
end
