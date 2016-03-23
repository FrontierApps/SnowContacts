class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
     
     t.belongs_to :contact, index: true
     
     t.string    "firstName",         limit: 50
     t.string    "lastName",          limit: 50
     t.string    "title",             limit: 50
     t.string    "mobilePhone",       limit: 30
     t.string    "emailName",         limit: 50
     t.string    "notes"
     t.timestamps
    end
  end
end
