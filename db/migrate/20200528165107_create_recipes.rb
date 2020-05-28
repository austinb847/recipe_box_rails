class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.column(:name, :string)
      t.column(:ingredient, :string)
      t.column(:instruction, :string)

      t.timestamps()
    end
  end
end
