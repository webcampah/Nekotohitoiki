class AddPrefectureToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :prefecture, :string
  end
end
