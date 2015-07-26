class CreateVoteSchedules < ActiveRecord::Migration
  def change
    create_table :vote_schedules do |t|
      t.datetime :date_from
      t.datetime :date_to
      t.string :winner

      t.timestamps null: false
    end
  end
end
