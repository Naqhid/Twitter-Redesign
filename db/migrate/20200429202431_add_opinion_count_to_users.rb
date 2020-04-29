class AddOpinionCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :opinion_count, :integer
  end
end
