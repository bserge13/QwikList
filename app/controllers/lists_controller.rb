class ListsController < ApplicationController
  def new;end 

  def create 
    new_list = List.create(list_params)

    if new_list.save && new_list.title != 'ex: Groceries'
      redirect_to list_path(new_list)
    else 
      redirect_to new_list_path
      flash[:alert] = "A list must have a 'Title' to be created" 
    end
  end

  def show 
    @list = List.find(params[:id])
    @items = @list.items 
  end

  def destroy 
    list = List.find(params[:id])
    list.destroy
    redirect_to root_path 
  end

  private 

  def list_params
    params.permit(:id, :title)
  end
end