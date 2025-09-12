# frozen_string_literal: true

class AddIndexesToClickEvents < ActiveRecord::Migration[7.1]
  def change
    # 日別集計や参照元集計の高速化用
    add_index :click_events, :created_at
    add_index :click_events, :referrer
    add_index :click_events, %i[link_id created_at]
  end
end
