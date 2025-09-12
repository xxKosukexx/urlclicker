# frozen_string_literal: true

class Link < ApplicationRecord
  has_many :click_events, dependent: :destroy

  validates :original_url, presence: true
  validates :slug, presence: true, uniqueness: true

  def short_url
    Rails.application.config.x.app.short_base_url + "/r/#{slug}"
  end
end
