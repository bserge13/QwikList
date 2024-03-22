class ItemsController < ApplicationController
  def create 
    Item.create!(item_params)
  end

  private 

  def item_params
    params.permit(:id, :description, :list_id)
  end
end