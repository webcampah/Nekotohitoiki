class DeletePrefectures < ActiveRecord::Migration[5.2]
  def change
  	drop_table :prefectures
  end
end
