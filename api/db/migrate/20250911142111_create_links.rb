class CreateLinks < ActiveRecord::Migration[7.2]
  def change
    create_table :links do |t|
      t.string :slug
      t.text :original_url

      t.timestamps
    end
  end
end
