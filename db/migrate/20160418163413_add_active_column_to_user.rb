class AddActiveColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :active, :integer, :limit => 1
  end
end
