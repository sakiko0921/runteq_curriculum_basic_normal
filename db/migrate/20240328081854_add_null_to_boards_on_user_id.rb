class AddNullToBoardsOnUserId < ActiveRecord::Migration[7.0]
  def change
    change_column_null :boards, :user_id, false
  end
end
