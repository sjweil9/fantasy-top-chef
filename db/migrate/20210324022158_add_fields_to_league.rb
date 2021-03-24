class AddFieldsToLeague < ActiveRecord::Migration[6.0]
  def change
    add_column :leagues, :max_players, :integer
    add_column :leagues, :password_digest, :string
    add_column :leagues, :guid, :string
  end
end
