class CreateScrapings < ActiveRecord::Migration[7.0]
  def change
    create_table :scrapings do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :image
      t.string :price
      t.string :rest
      t.string :rate
      t.string :feature
      t.integer :number

      t.timestamps
    end
  end
end
