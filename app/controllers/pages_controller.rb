class PagesController < ApplicationController
  def index
    @latest_items = Item.limit(6).order(created_at: :desc)
  end

  def contact
  end
end
