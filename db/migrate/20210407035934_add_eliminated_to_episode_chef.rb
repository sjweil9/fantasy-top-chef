class AddEliminatedToEpisodeChef < ActiveRecord::Migration[6.0]
  def change
    add_column :episode_chefs, :eliminated, :boolean
  end
end
