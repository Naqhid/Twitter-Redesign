class ChangeOpinionCountToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :opinion_count, 0)
  end
end
