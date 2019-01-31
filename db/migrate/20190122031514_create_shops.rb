class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.text :shop_name
      t.text :shop_image_id
      t.text :shop_descreption
      t.string :address

      t.timestamps
    end
  end
end
