class AddFieldsToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :sunday, :string
    add_column :businesses, :monday, :string
    add_column :businesses, :tuesday, :string
    add_column :businesses, :wednesday, :string
    add_column :businesses, :thursday, :string
    add_column :businesses, :friday, :string
    add_column :businesses, :saturday, :string
  end
end
