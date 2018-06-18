class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.order(:order).all
  end
end
