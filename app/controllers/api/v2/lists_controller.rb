class Api::V2::ListsController < ApplicationController
    before_action :set_list, only: [:show, :update, :destroy]
    before_action :authenticate_user, only: [:index, :create]
    # before_action :set_status, only: [:index]

    # GET /lists
    def index
        @lists = @listable.lists
        @incomplete = @lists.where.not(status: :completed)
        @completed = @lists.where(status: :completed)
        @pending = @lists.where(status: :pending)
        @working = @lists.where(status: :working)
        @ready = @lists.where(status: :ready)
    end

    # GET /lists/1
    def show
        set_status
        render json: {status: :ok, list: @list, tasks: @list.tasks }
    end

    # POST /lists
    def create
        @list = @listable.lists.new list_params
        @list.user = @user
        @list.pending!
        if @list.save
            render json: {status: :created, list: @list}
        else
            render json: {errors: @list.errors, status: :unprocessable_entity}
        end
    end

    # PATCH/PUT /lists/1
    def update
        if @list.update(list_params)
            render json: {list: @list, tasks: @list.tasks, status: :updated}
        else
            render json: @list.errors, status: :unprocessable_entity
        end
    end

    # DELETE /lists/1
    def destroy
        @list.destroy
        render json: {message: @list, status: :ok}
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
