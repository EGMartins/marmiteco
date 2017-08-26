class AddActiveToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :active, :boolean
  end
end
