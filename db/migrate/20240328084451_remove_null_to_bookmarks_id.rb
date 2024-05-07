class RemoveNullToBookmarksId < ActiveRecord::Migration[7.0]
  def change
    change_column_null :bookmarks, :user_id, true
    change_column_null :bookmarks, :board_id, true
  end
end
