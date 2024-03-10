class RemoveFkey < ActiveRecord::Migration[7.0]
  def change
    remove_column :boards, :users_id, :bigint
  end
end
