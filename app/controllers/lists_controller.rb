class ListsController < ApplicationController
    def index
        @list = List.all
        render json: @list
    end

    def show #used to show only second item of the list
        @currList = List.second
        render json: @currList
    end

    def create
        @newList = List.new(list_param)
        @newList.save
        render json: @newList, status: :ok
    end

    def destroy
        @currList = List.find_by_id(params[:id])
        @currList.destroy
    end

    def update
        @specificList = List.find_by_id(params[:id])
        @specificList.update(task:"THIS IS AN UPDATED VERSION",status:"done")
    end

    def list_param
        params.require(:list).permit(:status, :user_id, :task)
    end
end
