class AddDataSetting < ActiveRecord::Migration[7.0]
  def change
    change_column_null :boards, :title, false,0
    change_column_null :boards, :body, false,0

    change_column :boards, :users_id, :bigint, foreign_key: true
  end
end
