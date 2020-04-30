class ChangeCountFollowedToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :count_follower, 0)
    change_column_default(:users, :count_followed, 0)
  end
end
