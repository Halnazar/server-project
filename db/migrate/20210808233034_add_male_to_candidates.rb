class AddMaleToCandidates < ActiveRecord::Migration[6.1]
  def change
    add_column :candidates, :gender, :boolean
  end
end
