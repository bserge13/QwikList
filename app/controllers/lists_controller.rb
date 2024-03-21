class ListsController < ApplicationController
  def new;end 

  def create 
    list = List.create(list_params)

    if list.save && list.title != 'ex: Groceries'
      redirect_to root_path
    else 
      redirect_to new_list_path
      flash[:alert] = "A list must have a 'Title' to be created" 
    end
  end

  def show 
    @list = List.find(params[:id])
  end

  private 

  def list_params
    params.permit(:id, :title)
  end
end