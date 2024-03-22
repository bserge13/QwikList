class ItemsController < ApplicationController
  def destroy
    item = Item.find(params[:list_id])
    list = List.find(params[:id])
    # :list_id is actually the item id  
    item.destroy 
    redirect_to list_path(list)
  end
end