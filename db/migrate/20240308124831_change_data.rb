class ChangeData < ActiveRecord::Migration[7.0]
  def change
    change_column :boards, :user_id, :bigint
  end
end
