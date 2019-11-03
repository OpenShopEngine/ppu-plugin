require 'test_helper'

module Ppu
  class TransactionsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @transaction = ppu_transactions(:one)
    end

    test "should get index" do
      get transactions_url, as: :json
      assert_response :success
    end

    test "should create transaction" do
      assert_difference('Transaction.count') do
        post transactions_url, params: { transaction: { checkout_id: @transaction.checkout_id, payout: @transaction.payout } }, as: :json
      end

      assert_response 201
    end

    test "should show transaction" do
      get transaction_url(@transaction), as: :json
      assert_response :success
    end

    test "should update transaction" do
      patch transaction_url(@transaction), params: { transaction: { checkout_id: @transaction.checkout_id, payout: @transaction.payout } }, as: :json
      assert_response 200
    end

    test "should destroy transaction" do
      assert_difference('Transaction.count', -1) do
        delete transaction_url(@transaction), as: :json
      end

      assert_response 204
    end
  end
end
