class CreateStations < ActiveRecord::Migration[6.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.string :aqi
      t.string :time

      t.timestamps
    end
    add_reference(:stations, :country)
  end
end
