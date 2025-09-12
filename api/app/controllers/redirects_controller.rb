# frozen_string_literal: true

class RedirectsController < ApplicationController
  def show
    link = Link.find_by!(slug: params[:slug])
    ClickEvent.create!(
      link: link,
      ip_hash: Digest::SHA256.hexdigest(request.remote_ip.to_s),
      user_agent: request.user_agent,
      referrer: request.referer,
      visitor_id: cookies[:vid]
    )
    redirect_to link.original_url, allow_other_host: true 
  end
end