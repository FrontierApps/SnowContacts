class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.belongs_to :sign, index: true
      t.string    :customerDesc
      t.string    :solution
      t.datetime  :requestDate
      t.datetime  :finishDate      
      t.timestamps
    end
  end
end
