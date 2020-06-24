class RemovePostFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tags, :post, foreign_key: true
  end
end
