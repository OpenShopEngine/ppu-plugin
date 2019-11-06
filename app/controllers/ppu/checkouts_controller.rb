require_dependency "ppu/application_controller"

module Ppu
  class CheckoutsController < ApplicationController
    before_action :set_checkout, only: [:show, :update, :destroy]
    before_action :current_user, only: [:index, :show, :create, :update, :destroy]

    # GET /checkouts
    def index
      if @current_user.role? :admin
        @checkouts = Checkout.where.not(ppu_transaction_id: nil, status: 'sent').order(:updated_at => :desc, :status => :asc)
        render json: @checkouts
      else
        render json: "Only for admins!", status: :bad_request
      end
    end

    # GET /checkouts/1
    def show
      render json: @checkout
    end

    # POST /checkouts
    def create
      if @current_user.role? :payment_system
        @checkout = Checkout.new(ActiveSupport::JSON.decode(request.body.read))

        if @checkout.save
          render json: @checkout, status: :created, location: @checkout
        else
          render json: @checkout.errors, status: :unprocessable_entity
        end
      else
        render json: "NOT_PAYMENT_SYSTEM", status: :bad_request
      end
    end

    # PATCH/PUT /checkouts/1
    def update
      if @current_user.role? :admin
        if @checkout.update(ActiveSupport::JSON.decode(request.body.read))
          render json: @checkout
        else
          render json: @checkout.errors, status: :unprocessable_entity
        end
      else
        render json: {error: "Not admin!"}
      end
    end

    # DELETE /checkouts/1
    def destroy
      if @current_user.role? :admin
        @checkout.destroy
      else
        render json: "Only for admins!", status: :bad_request
      end
    end

    private
      def current_user
        @current_user = User.find(session[:user_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_checkout
        @checkout = Checkout.find(params[:id])
      end
  end
end
