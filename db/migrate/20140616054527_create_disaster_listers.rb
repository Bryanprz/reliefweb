class CreateDisasterListers < ActiveRecord::Migration
  def change
    create_table :disaster_listers do |t|

      t.timestamps
    end
  end
end
