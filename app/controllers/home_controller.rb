class HomeController < ApplicationController
  def index
    if current_user.role == 'Admin'
  	  @users = User.selector
     elsif current_user.role == 'Selector'  
       redirect_to home_candidate_url and return
     elsif current_user.role == 'Voter'
       redirect_to home_final_candidate_url and return   
  	 end
  end

  def select_candidate
  	current_user.candidate = Candidate.find(params[:id])
    redirect_to home_index_url and return
  end

  def final_candidate
    @candidate = Candidate.final_candidate
  end

  def winner
    Vote.winner
    @candidate = Candidate.find_by_winner(true)

  end

  def candidate
  	@candidates = Candidate.all
  end
  
  def activate_selector
    @user = User.find(params[:id])
    @user.activate_selector
    redirect_to home_index_url and return
  end
end
