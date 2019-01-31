class RenameShopDescreptionColumnToShops < ActiveRecord::Migration[5.2]
  def change
  	rename_column :shops, :shop_descreption, :shop_description
  end
end
