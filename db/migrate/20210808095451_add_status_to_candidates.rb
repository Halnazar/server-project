class AddStatusToCandidates < ActiveRecord::Migration[6.1]
  def change
    drop_table :statuses
    add_column :candidates, :status, :integer
  end
end
