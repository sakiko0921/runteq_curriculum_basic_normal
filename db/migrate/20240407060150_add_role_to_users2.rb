class AddRoleToUsers2 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string, default: 0, null: false
  end
end
