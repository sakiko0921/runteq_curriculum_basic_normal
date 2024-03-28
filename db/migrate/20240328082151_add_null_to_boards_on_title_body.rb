class AddNullToBoardsOnTitleBody < ActiveRecord::Migration[7.0]
  def change
    change_column_null :boards, :body, false
    change_column_null :boards, :title, false
  end
end
