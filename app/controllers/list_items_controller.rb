class ListItemsController < ApplicationController
  def create 
    @list = List.find(params[:list_id])
    @list.items.create(item_params)
    redirect_to list_path(@list)
  end

  private 

  def item_params 
    params.permit(:id, :list_id, :description)
  end
end