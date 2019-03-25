class PagesController < ApplicationController
  def get_links
    @pages = Page.all
  end

  def permalink
    @permalink = Page.find_by(permalink: params[:permalink])
  end
end
