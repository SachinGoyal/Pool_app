class HomeController < ApplicationController
  def index
  	@users = User.all.where(:role => 'Selector')
  end
end
