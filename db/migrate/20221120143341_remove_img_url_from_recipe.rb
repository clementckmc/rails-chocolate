class RemoveImgUrlFromRecipe < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :img_url, :string
  end
end
