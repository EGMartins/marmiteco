class AddPhoneToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :business_phone, :string
  end
end
