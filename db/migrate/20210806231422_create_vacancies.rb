class CreateVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :vacancies do |t|
         t.string :name, null: false, default: ""
         t.boolean :status, null: false, default: false
         t.date :opening_date, null: false
         t.date :closing_date

         t.belongs_to :position

         t.timestamps
       end
  end
end
