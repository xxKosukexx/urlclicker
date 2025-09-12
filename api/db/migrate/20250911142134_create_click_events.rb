# frozen_string_literal: true

class CreateClickEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :click_events do |t|
      t.references :link, null: false, foreign_key: true
      t.string :ip_hash
      t.text :user_agent
      t.text :referrer
      t.string :visitor_id

      t.timestamps
    end
  end
end
