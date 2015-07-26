require 'test_helper'

class VoteSchedulesControllerTest < ActionController::TestCase
  setup do
    @vote_schedule = vote_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_schedule" do
    assert_difference('VoteSchedule.count') do
      post :create, vote_schedule: { date_from: @vote_schedule.date_from, date_to: @vote_schedule.date_to, winner: @vote_schedule.winner }
    end

    assert_redirected_to vote_schedule_path(assigns(:vote_schedule))
  end

  test "should show vote_schedule" do
    get :show, id: @vote_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_schedule
    assert_response :success
  end

  test "should update vote_schedule" do
    patch :update, id: @vote_schedule, vote_schedule: { date_from: @vote_schedule.date_from, date_to: @vote_schedule.date_to, winner: @vote_schedule.winner }
    assert_redirected_to vote_schedule_path(assigns(:vote_schedule))
  end

  test "should destroy vote_schedule" do
    assert_difference('VoteSchedule.count', -1) do
      delete :destroy, id: @vote_schedule
    end

    assert_redirected_to vote_schedules_path
  end
end
