class CreateBitchartsDays < ActiveRecord::Migration
  def change
    create_table :bitcharts_days do |t|
      t.date :date, null: false
      t.string :key, null: false, limit: 200
      t.integer :value, null: false

      t.timestamps null: false
    end
  end
end
