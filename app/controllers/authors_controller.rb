class AuthorsController < ApplicationController
  def index
    @authors = User.includes(:posts).all
  end
end
