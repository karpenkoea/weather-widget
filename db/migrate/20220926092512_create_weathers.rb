class CreateWeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :weathers do |t|
      t.string :city, null: false, index: { unique: true }
      t.string :timezone

      t.timestamps
    end
  end
end
