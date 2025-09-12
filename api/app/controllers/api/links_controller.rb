# frozen_string_literal: true

module Api
  class LinksController < ApplicationController
    def create
      link = Link.create!(
        original_url: params[:original_url],
        slug: SecureRandom.alphanumeric(6)
      )
      render json: { slug: link.slug, url: "#{ENV['APP_ORIGIN']}/r/#{link.slug}" }
    end

    def index
      render json: Link.all
    end
  end
end
