class RemovePrefectureIdFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_index :shops, :prefecture_id
    remove_column :shops, :prefecture_id, :string
  end
end
