class AddShopUrlToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :shop_url, :text
  end
end
