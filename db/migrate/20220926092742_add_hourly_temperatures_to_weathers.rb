class AddHourlyTemperaturesToWeathers < ActiveRecord::Migration[6.0]
  def change
    add_column :weathers, :hourly_temperatures, :text, array: true, default: []
  end
end
