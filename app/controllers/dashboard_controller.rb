class DashboardController < ApplicationController
  def show
    @entries = Entry.preload(feed: :user).order(published_at: :desc).limit(5)
    @questions = Question.preload(:user).order(created_at: :desc).limit(5)
  end
end
