class TweetsController < ApplicationController

def index
  @tweets = Tweet.order(id: :desc)
  @tweet = Tweet.new

end


def destroy
  @tweet = Tweet.find(params[:id])
 @tweet.destroy
   respond_to do |format|
   #format.html {redirect_to tweet}
   format.js
   end

end

def show
  @tweet = Tweet.new
end

def create
 @tweet = Tweet.new(tweet_params)
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to @tweet }
        format.js
      end
    else
      render :new
   end
end

def edit
 @tweet = Tweet.find(params[:id])
end

def update
  @tweet = Tweet.find(params[:id])
 @tweet.content = tweet_params[:content]
 if @tweet.save
   redirect_to '/tweets'
 else
  render :edit
 end
end

private

def tweet_params
  params.require(:tweet).permit(:content)
end

end
