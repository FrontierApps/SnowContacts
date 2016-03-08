class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
     t.string    "locationName"
     t.string    "Address"
     t.string    "Address1",          limit: 50
     t.string    "City",              limit: 50
     t.string    "StateOrProvince",   limit: 20
     t.string    "PostalCode",        limit: 20
     t.string    "WorkPhone",         limit: 30
     t.string    "FaxNumber",         limit: 30
     t.boolean :is_primary

     t.references :contact, index: true, foreign_key: true
     t.timestamps
    end
  end
end
