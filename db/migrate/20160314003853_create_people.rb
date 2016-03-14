class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
     t.belongs_to :location, index: true
     t.string    "FirstName",         limit: 50
     t.string    "LastName",          limit: 50
     t.string    "Title",             limit: 50
     t.string    "MobilePhone",       limit: 30
     t.string    "EmailName",         limit: 50
     t.timestamps
    end
  end
end
