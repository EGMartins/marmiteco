class AddDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :end_date, :date
  end
end
