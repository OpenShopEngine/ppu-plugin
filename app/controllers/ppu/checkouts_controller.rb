require_dependency "ppu/application_controller"

module Ppu
  class CheckoutsController < ApplicationController
    before_action :set_checkout, only: [:show, :update, :destroy]

    # GET /checkouts
    def index
      @checkouts = Checkout.all

      render json: @checkouts
    end

    # GET /checkouts/1
    def show
      render json: @checkout
    end

    # POST /checkouts
    def create
      @checkout = Checkout.new(ActiveSupport::JSON.decode(request.body.read))

      if @checkout.save
        render json: @checkout, status: :created, location: @checkout
      else
        render json: @checkout.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /checkouts/1
    def update
      if @checkout.update(ActiveSupport::JSON.decode(request.body.read))
        render json: @checkout
      else
        render json: @checkout.errors, status: :unprocessable_entity
      end
    end

    # DELETE /checkouts/1
    def destroy
      @checkout.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_checkout
        @checkout = Checkout.find(params[:id])
      end
  end
end
