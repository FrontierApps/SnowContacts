class CreateAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :attributes do |t|
	  t.belongs_to :sign, index: true
	  t.string    :type
	  t.string    :description
      t.timestamps
    end
  end
end
