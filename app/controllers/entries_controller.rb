class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = Entry.preload(feed: :user).order(created_at: :desc)
  end
end
