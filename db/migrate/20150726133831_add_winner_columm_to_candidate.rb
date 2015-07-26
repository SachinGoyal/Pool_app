class AddWinnerColummToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :winner, :boolean
  end
end
