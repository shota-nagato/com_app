class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @entries = pagy(Entry.preload(feed: :user).order(published_at: :desc))
  end
end
