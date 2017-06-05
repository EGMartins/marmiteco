require 'test_helper'

class BusinessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business = businesses(:one)
  end

  test "should get index" do
    get businesses_url
    assert_response :success
  end

  test "should get new" do
    get new_business_url
    assert_response :success
  end

  test "should create business" do
    assert_difference('Business.count') do
      post businesses_url, params: { business: { business_city: @business.business_city, business_info: @business.business_info, business_name: @business.business_name, business_neighbor: @business.business_neighbor, business_number: @business.business_number, business_state: @business.business_state, business_street: @business.business_street, business_time: @business.business_time, latitude: @business.latitude, longitude: @business.longitude, user_id: @business.user_id } }
    end

    assert_redirected_to business_url(Business.last)
  end

  test "should show business" do
    get business_url(@business)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_url(@business)
    assert_response :success
  end

  test "should update business" do
    patch business_url(@business), params: { business: { business_city: @business.business_city, business_info: @business.business_info, business_name: @business.business_name, business_neighbor: @business.business_neighbor, business_number: @business.business_number, business_state: @business.business_state, business_street: @business.business_street, business_time: @business.business_time, latitude: @business.latitude, longitude: @business.longitude, user_id: @business.user_id } }
    assert_redirected_to business_url(@business)
  end

  test "should destroy business" do
    assert_difference('Business.count', -1) do
      delete business_url(@business)
    end

    assert_redirected_to businesses_url
  end
end
