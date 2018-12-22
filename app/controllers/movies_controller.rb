class MoviesController < ApplicationController
  before_action :logged_in_user, only: [:index, :dashboard, :movie_details, :search_results]

  def index
    @user = current_user
    @list = @user.lists
    if params[:page].blank? 
      @allmovies = Tmdb::Movie.popular
    else
      @allmovies = Tmdb::Movie.popular(page: params[:page])
    end
  end

  def dashboard
  end

  def movie_details
    if params[:id].blank?
      redirect_to dashboard_path
    else
      @details = Tmdb::Movie.detail(params[:id])
      redirect_to dashboard_path if @details.nil?
      @casts = Tmdb::Movie.cast(params[:id])
    end
  end

  def search_results
    @user = current_user
    @list = @user.lists
    if params[:page].blank? && params[:name].blank?
      redirect_to dashboard_path
    elsif params[:page].blank?
      @searchedname = params[:name]
      @moviesnames = Tmdb::Search.movie(@searchedname)
    else
      @searchedname = params[:name]
      @moviesnames = Tmdb::Search.movie(@searchedname, page: params[:page])
    end
  end

  private
  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
