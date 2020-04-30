class AddCountFollowedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :count_followed, :integer
  end
end
