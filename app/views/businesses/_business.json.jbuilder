json.extract! business, :id, :business_name, :business_info, :business_time, :business_street, :business_number, :business_neighbor, :business_city, :business_state, :latitude, :longitude, :user_id, :created_at, :updated_at
json.url business_url(business, format: :json)
