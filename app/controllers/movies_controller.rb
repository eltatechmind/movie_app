class MoviesController < ApplicationController
  def index
    if params[:page].blank? 
      @genres = Tmdb::Movie.popular
    elsif 
      @genres = Tmdb::Movie.popular(page: params[:page])
    end
  end
end
