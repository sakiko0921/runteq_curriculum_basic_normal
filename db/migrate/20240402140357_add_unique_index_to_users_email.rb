class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email, unique: true, name: 'unique_index_users_email'
  end
end
