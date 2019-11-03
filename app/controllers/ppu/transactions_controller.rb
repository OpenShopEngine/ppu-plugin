require_dependency "ppu/application_controller"

module Ppu
  class TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show, :update, :destroy]

    # GET /transactions
    def index
      @transactions = Transaction.all

      render json: @transactions
    end

    # GET /transactions/1
    def show
      render json: @transaction
    end

    # POST /transactions
    def create
      @transaction = Transaction.new(ActiveSupport::JSON.decode(request.body.read))

      if @transaction.save
        render json: @transaction, status: :created, location: @transaction
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /transactions/1
    def update
      if @transaction.update(ActiveSupport::JSON.decode(request.body.read))
        render json: @transaction
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end

    # DELETE /transactions/1
    def destroy
      @transaction.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_transaction
        @transaction = Transaction.find(params[:id])
      end
  end
end
