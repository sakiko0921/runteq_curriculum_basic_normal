class AddCulumnToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :user_id, :integer
    add_column :boards, :title, :string
    add_column :boards, :body, :text
  end
end
