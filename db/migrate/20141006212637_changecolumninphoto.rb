class Changecolumninphoto < ActiveRecord::Migration
  def change
  	remove_column :photos, :avatar, :string
  	add_column :photos, :link, :string
  end
end
