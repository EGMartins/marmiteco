class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :business_name, limit: 150, null: false
      t.text :business_info, limit: 450, null: false
      t.string :business_time, limit: 150, null: false
      t.string :business_street, limit: 150, null: false
      t.string :business_number, limit: 30, null: false
      t.string :business_neighbor, limit: 50, null: false
      t.string :business_city, limit: 100, null: false
      t.string :business_state, limit: 2, null: false
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
