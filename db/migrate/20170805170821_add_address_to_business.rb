class AddAddressToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :address, :string
  end
end
