class HomeController < ApplicationController
  def index
  	@users = User.all.where(:role => 'Selector')
  end

  def activate_selector
    @user = User.find(params[:id])
    @user.activate_selector
    redirect_to home_index_url and return
  end
end
