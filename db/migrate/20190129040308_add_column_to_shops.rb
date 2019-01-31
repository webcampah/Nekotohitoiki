class AddColumnToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :favorites_count, :integer
  end
end
