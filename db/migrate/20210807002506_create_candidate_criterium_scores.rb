class CreateCandidateCriteriumScores < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_criterium_scores do |t|

        t.integer :score, null: false, default: 0

           t.belongs_to :criterium
           t.belongs_to :candidate

           t.timestamps
      end
  end
end
