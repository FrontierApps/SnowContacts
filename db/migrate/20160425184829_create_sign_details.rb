class CreateSignDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :sign_details do |t|
      t.belongs_to :sign, index: true
      t.string    :detail
      t.string    :description
      t.timestamps
    end
  end
end
