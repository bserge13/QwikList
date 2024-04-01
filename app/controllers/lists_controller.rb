class ListsController < ApplicationController
  def new;end 

  def create
    require 'pry'; binding.pry
    if params[:title].empty? == false 
      new_list = List.create(list_params)
      if new_list.save 
        redirect_to user_list_path(new_list)
      else 
        flash[:alert] = 'Failed to create list'
        render :new 
      end 
    else 
      redirect_to new_list_path 
      flash[:alert] = "A list must have a 'Title' to be created"
    end
  end

  def show 
    @user = User.find(params[:user_id])
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
    params.permit(:title)
  end
end