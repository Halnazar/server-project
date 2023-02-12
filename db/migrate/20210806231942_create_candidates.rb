class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
            t.string :first_name, null: false, default: ""
            t.string :second_name, null: false, default: ""
            t.string :image_url
            t.string :email, null: false, default: ""
            t.string :number
            t.float :expirience_years, default: 0
            t.text :biography, default: ""

            t.belongs_to :status
            t.belongs_to :vacancy

            t.timestamps
          end
  end
end
