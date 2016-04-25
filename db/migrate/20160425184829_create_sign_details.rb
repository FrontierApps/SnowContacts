class CreateSignDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :sign_details do |t|

      t.timestamps
    end
  end
end
