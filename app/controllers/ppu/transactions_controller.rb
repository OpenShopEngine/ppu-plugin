require_dependency "ppu/application_controller"

module Ppu
  class TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show, :destroy]
    before_action :current_user, only: [:index, :show, :create, :destroy]

    # GET /transactions
    def index
      if @current_user.role? :admin
        @transactions = Transaction.all
        render json: @transactions
      else
        render json: "Only for admins!", status: :bad_request
      end
    end

    # GET /transactions/1
    def show
      if @current_user.role? :admin
        render json: @transaction
      else
        render json: "Only for admins!", status: :bad_request
      end
    end

    # POST /transactions
    def create
      if @current_user.role? :payment_system
        @transaction = Transaction.new(ActiveSupport::JSON.decode(request.body.read))

        if @transaction.save
          render json: @transaction, status: :created, location: @transaction
        else
          render json: @transaction.errors, status: :unprocessable_entity
        end
      else
        render json: "NOT_PAYMENT_SYSTEM", status: :bad_request
      end
    end

    # DELETE /transactions/1
    def destroy
      if @current_user.role? :admin
        @transaction.destroy
      else
        render json: "Only for admins!", status: :bad_request
      end
    end

    private
      def current_user
        @current_user = User.find(session[:user_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_transaction
        @transaction = Transaction.find(params[:id])
      end
  end
end
