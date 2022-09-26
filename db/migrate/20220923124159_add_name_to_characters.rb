class AddNameToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :name, :string
  end
end
