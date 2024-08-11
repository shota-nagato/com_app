class DashboardController < ApplicationController
  def show
    @entries = Entry.preload(feed: :user).order(created_at: :desc)
  end
end
