class ListsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end 

  def create
    user = User.find(params[:user_id])

    if params[:title].empty? == false 
      new_list = List.create(list_params)
      if new_list.save 
        redirect_to user_list_path(user, new_list)
      else 
        flash[:alert] = 'Failed to create list'
        redirect_to new_user_list_path(user)
      end 
    else 
      redirect_to new_user_list_path(user)
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
    params.permit(:title, :user_id)
  end
end