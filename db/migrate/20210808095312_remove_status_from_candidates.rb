class RemoveStatusFromCandidates < ActiveRecord::Migration[6.1]
  def change
    remove_reference :candidates, :status, null: false
  end
end
