# This migration comes from bitcharts (originally 20160621182604)
class CreateBitchartsDays < ActiveRecord::Migration
  def change
    create_table :bitcharts_days do |t|
      t.date :date
      t.string :key
      t.integer :value

      t.timestamps null: false
    end
  end
end
