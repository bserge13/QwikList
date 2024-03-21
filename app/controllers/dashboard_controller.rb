class DashboardController < ApplicationController
  def index
    @lists = List.desc_order 
  end
end