class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def index
        @lists = List.all
    end

    def show
    end

    def new
        @list = List.new
    end

    def create
        @list = List.new(list_params)
        @list.save
        redirect_to root_path
    end

    def edit
    end

    def update
        @list.update(list_params)
        # redirect_to list_path(@list)
        redirect_to @list
    end

    def destroy
        @list.destroy
        redirect_to root_path
    end

    private

    def set_list
        @list = list.find(params[:id])
    end

    def list_params
        params.require(:list).permit(:name)
    end
end
