class Link < ApplicationRecord
  has_many :click_events, dependent: :destroy

  validates :original_url, presence: true
  validates :slug, presence: true, uniqueness: true
end