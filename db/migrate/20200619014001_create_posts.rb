class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string     :title,       null: false
      t.text       :text,        null: false
      t.integer    :tag_id
      t.string     :image
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
