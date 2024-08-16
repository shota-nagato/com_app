class EntriesController < ApplicationController
  def index
    @entries = Entry.preload(feed: :user).order(created_at: :desc)
  end
end
