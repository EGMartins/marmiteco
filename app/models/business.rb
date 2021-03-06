class Business < ApplicationRecord

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode
  
  belongs_to :user

  validates :business_name, presence: true, length: { maximum: 150 }
  validates :business_info, presence: true, length: { maximum: 450 }
  validates :business_time, presence: true, length: { maximum: 150 }
  validates :business_street, presence: true, length: { maximum: 150 }
  validates :business_number, presence: true, length: { maximum: 30 }
 validates :business_neighbor, presence: true, length: { maximum: 50 }
  validates :business_city, presence: true, length: { maximum: 100 }
  validates :business_state, presence: true, length: { maximum: 2 }
  validates :business_phone, presence: true



  def address
    "#{business_street}, #{business_number}, #{business_neighbor}, #{business_city}, #{business_state}"
  end
end
