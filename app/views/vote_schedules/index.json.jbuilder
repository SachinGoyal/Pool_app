json.array!(@vote_schedules) do |vote_schedule|
  json.extract! vote_schedule, :id, :date_from, :date_to, :winner
  json.url vote_schedule_url(vote_schedule, format: :json)
end
