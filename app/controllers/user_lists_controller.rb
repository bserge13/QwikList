class UserListsController < ApplicationController
  def new;end 
  
  def create
    if params[:title].empty? == false 
      new_list = List.create(list_params)
      if new_list.save 
        redirect_to list_path(new_list)
      else 
        flash[:alert] = 'Failed to create list'
        render :new 
      end 
    else 
        redirect_to new_list_path 
        flash[:alert] = "A list must have a 'Title' to be created"
    end
  end 
end