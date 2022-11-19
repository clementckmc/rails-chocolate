class AddFullNameToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :full_name, :string
  end
end
