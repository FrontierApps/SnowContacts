class CreateSigns < ActiveRecord::Migration[5.0]
  def change
    create_table :signs do |t|
	  t.belongs_to :contact, index: true
	  t.belongs_to :location, index: true
	  t.string    "type"
	  t.string    "locationDesc"
	  t.datetime  "installDate"
	  t.timestamps


    end
  end
end
