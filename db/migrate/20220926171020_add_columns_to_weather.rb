class AddColumnsToWeather < ActiveRecord::Migration[6.0]
  def change
    add_column :weathers, :current_temperature, :string
    add_column :weathers, :max_temp, :string
    add_column :weathers, :min_temp, :string
    add_column :weathers, :avg_temp, :string
  end
end
