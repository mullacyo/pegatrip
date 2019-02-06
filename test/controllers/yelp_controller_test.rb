require 'test_helper'

class YelpControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get yelp_show_url
    assert_response :success
  end

  test "should get index" do
    get yelp_index_url
    assert_response :success
  end

  test "should get map" do
    get yelp_map_url
    assert_response :success
  end

  test "should get search" do
    get yelp_search_url
    assert_response :success
  end

end
