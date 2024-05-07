class AddUniqueConstraintToResetPasswordToken < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :reset_password_token, unique: true, name: "index_users_on_reset_password_token_unique"
  end
end
