class TweetsController < ApplicationController
  def index
    @per_page = 15.0
    @tweets = Tweet.limit(@per_page).offset(@per_page * current_page)
  end

  def total_pages
    (Tweet.count / @per_page).ceil
  end

  def current_page
    page = params[:page].to_i
    @page = if page < total_pages && page > 0
      page
    else
      0
    end
  end

  helper_method :total_pages
  helper_method :current_page

  def new
    @tweet = Tweet.new(user_id: current_user.id)
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to @tweet, notice: 'Tweet was created.'
    else
      render :new
    end
  end

  def show
    @grade = Tweet.find(params["id"])
    render :show
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet was updated.'
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params["id"])
    @tweet.destroy
    redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  def tweet_params
    params.require(:tweet).permit( :user_id, :message, user_attributes: [:full_name, :email, :password, :full_name, :nickname])
  end

end
