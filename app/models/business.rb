class Business < ApplicationRecord

  geocoded_by :address
  after_validation :geocode,
                   :if => lambda{ |obj| obj.address_changed? }
  belongs_to :user

  validates :business_name, presence: true, length: { maximum: 150 }
  validates :business_info, presence: true, length: { maximum: 450 }
  validates :business_time, presence: true, length: { maximum: 150 }
  validates :business_street, presence: true, length: { maximum: 150 }
  validates :business_number, presence: true, length: { maximum: 30 }
  validates :business_neighbor, presence: true, length: { maximum: 50 }
  validates :business_city, presence: true, length: { maximum: 100 }
  validates :business_state, presence: true, length: { maximum: 2 }



  def address
    "#{business_street}, #{business_number}, #{business_neighbor}, #{business_city}, #{business_state}"
  end
end
