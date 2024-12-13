require "test_helper"

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get checkout_new_url
    assert_response :success
  end

  test "should get create" do
    get checkout_create_url
    assert_response :success
  end

  test "should get calculate_total" do
    get checkout_calculate_total_url
    assert_response :success
  end

  test "should get calculate_taxes" do
    get checkout_calculate_taxes_url
    assert_response :success
  end

  test "should get calculate_tax_rate_for_product" do
    get checkout_calculate_tax_rate_for_product_url
    assert_response :success
  end
end
