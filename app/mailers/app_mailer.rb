class AppMailer < ApplicationMailer
  def voter(final_candidate,voter,vote_schedule)
  	@final_candidate = final_candidate
    @voter = voter
    @vote_schedule = vote_schedule
    mail(to: @voter.email, subject: 'Voting Schedule')
  end
end
