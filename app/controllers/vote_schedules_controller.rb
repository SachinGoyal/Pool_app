class VoteSchedulesController < ApplicationController
  before_action :set_vote_schedule, only: [:show, :edit, :update, :destroy]

  # GET /vote_schedules
  # GET /vote_schedules.json
  def index
    @vote_schedules = VoteSchedule.all
  end

  # GET /vote_schedules/1
  # GET /vote_schedules/1.json
  def show
  end

  # GET /vote_schedules/new
  def new
    @vote_schedule = VoteSchedule.new
  end

  # GET /vote_schedules/1/edit
  def edit
  end

  # POST /vote_schedules
  # POST /vote_schedules.json
  def create
    @vote_schedule = VoteSchedule.new(vote_schedule_params)

    respond_to do |format|
      if @vote_schedule.save
        format.html { redirect_to @vote_schedule, notice: 'Vote schedule was successfully created.' }
        format.json { render :show, status: :created, location: @vote_schedule }
      else
        format.html { render :new }
        format.json { render json: @vote_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_schedules/1
  # PATCH/PUT /vote_schedules/1.json
  def update
    respond_to do |format|
      if @vote_schedule.update(vote_schedule_params)
        format.html { redirect_to @vote_schedule, notice: 'Vote schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote_schedule }
      else
        format.html { render :edit }
        format.json { render json: @vote_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_schedules/1
  # DELETE /vote_schedules/1.json
  def destroy
    @vote_schedule.destroy
    respond_to do |format|
      format.html { redirect_to vote_schedules_url, notice: 'Vote schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_schedule
      @vote_schedule = VoteSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_schedule_params
      params.require(:vote_schedule).permit(:date_from, :date_to, :winner)
    end
end
