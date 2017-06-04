class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 100, null: false
      t.string :email, limit: 100, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
