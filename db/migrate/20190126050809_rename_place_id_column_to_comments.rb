class RenamePlaceIdColumnToComments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :comments, :place_id, :shop_id
  end
end
