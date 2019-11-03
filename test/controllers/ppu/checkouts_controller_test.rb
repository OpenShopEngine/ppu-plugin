require 'test_helper'

module Ppu
  class CheckoutsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @checkout = ppu_checkouts(:one)
    end

    test "should get index" do
      get checkouts_url, as: :json
      assert_response :success
    end

    test "should create checkout" do
      assert_difference('Checkout.count') do
        post checkouts_url, params: { checkout: { address: @checkout.address, email: @checkout.email, fullname: @checkout.fullname, phone: @checkout.phone, products: @checkout.products } }, as: :json
      end

      assert_response 201
    end

    test "should show checkout" do
      get checkout_url(@checkout), as: :json
      assert_response :success
    end

    test "should update checkout" do
      patch checkout_url(@checkout), params: { checkout: { address: @checkout.address, email: @checkout.email, fullname: @checkout.fullname, phone: @checkout.phone, products: @checkout.products } }, as: :json
      assert_response 200
    end

    test "should destroy checkout" do
      assert_difference('Checkout.count', -1) do
        delete checkout_url(@checkout), as: :json
      end

      assert_response 204
    end
  end
end
