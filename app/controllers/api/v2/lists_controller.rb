class Api::V2::ListsController < ApplicationController
    before_action :set_list, only: [:show, :update, :destroy]
    before_action :authenticate_user, only: [:index, :create]

    # GET /lists
    def index
        @lists = @listable.lists
        @counts = {
            pending: @lists.where(status: :pending).count,
            working: @lists.where(status: :working).count,
            ready: @lists.where(status: :ready).count,
            completed: @lists.where(status: :completed).count,
        }
        # @statuses = {
        #     completed: @lists.where(status: :completed),
        #     pending: @lists.where(status: :pending),
        #     working: @lists.where(status: :working),
        #     ready: @lists.where(status: :ready),
        # }
        # @all = {
        #     all: @lists,
        #     incomplete: @lists.where.not(status: :completed),
        #     completed: @lists.where(status: :completed),
        # }
    end

    # GET /lists/1
    def show
        set_status
        render status: :ok
    end



    # POST /lists
    def create
        @list = @listable.lists.new list_params
        @list.user = @user
        @list.pending!
        if @list.save
            render status: :created
        else
            render json: {errors: @list.errors, status: :unprocessable_entity}
        end
    end

    # PATCH/PUT /lists/1
    def update
        if @list.update(list_params)
            render status: :ok
        else
            render json: @list.errors, status: :unprocessable_entity
        end
    end

    # DELETE /lists/1
    def destroy
        @list.destroy
        render status: :ok
    end


    private
    # Use callbacks to share common setup or constraints between actions.

    def set_list
        # byebug
        @list = List.find(params[:id])
    end

    def set_user
        @user = User.find(params[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_params
        params.require(:list).permit(:title, :complete, :status)
    end
end
