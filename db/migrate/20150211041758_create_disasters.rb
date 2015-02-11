class CreateDisasters < ActiveRecord::Migration
  def change
    create_table :disasters do |t|
      t.string :name
      t.date :date
      t.string :country
      t.text :description

      t.timestamps
    end
  end
end
