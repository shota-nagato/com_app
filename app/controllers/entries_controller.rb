class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = Entry.preload(feed: :user).order(published_at: :desc)
  end
end
