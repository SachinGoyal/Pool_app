class AddSelectionStatusColumnToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :selection_status, :boolean, defalut: false
  end
end
