class AddUserRefToCandidates < ActiveRecord::Migration[6.1]
  def change
    add_reference :candidates, :user, null: false
  end
end
