class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :img_url
      t.text :instruction

      t.timestamps
    end
  end
end
