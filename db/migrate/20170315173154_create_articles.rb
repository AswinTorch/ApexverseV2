class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :title
      t.string :banner_image_url
      t.text :content

      t.timestamps
    end
  end
end
