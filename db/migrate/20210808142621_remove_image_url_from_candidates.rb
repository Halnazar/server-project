class RemoveImageUrlFromCandidates < ActiveRecord::Migration[6.1]
  def change
    remove_column :candidates, :image_url, :string
  end
end
