class CreateJobnumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :jobnumbers do |t|
     t.string  "JobNumber",    limit: 45
     t.belongs_to :contacts
     t.belongs_to :sign
     t.date    "DateStart"
     t.boolean "Complete",                 default: false
     t.string  "projectName",  limit: 45
     t.string  "Rep",          limit: 45
     t.string  "RequestedBy",  limit: 90
     t.string  "QuoteRef",     limit: 45
     t.date    "DueDate"
     t.string  "notes",        limit: 400
     t.timestamps
    end
  end
end
