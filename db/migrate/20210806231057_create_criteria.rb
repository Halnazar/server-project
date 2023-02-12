class CreateCriteria < ActiveRecord::Migration[6.1]
  def change
    create_table :criteria do |t|
             t.string :name, null: false, default: ""

             t.timestamps
           end

  end
end
