class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nombre, :string
    add_column :users, :area_id, :integer
    add_column :users, :autorizado, :string
    add_column :users, :tipo, :string
  end
end
