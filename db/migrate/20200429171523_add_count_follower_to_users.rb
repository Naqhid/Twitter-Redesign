class AddCountFollowerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :count_follower, :integer
  end
end
