class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

def search
  if params[:search].present?
    @post = Post.search(params[:search])
  else
    @post = Post.all
  end
end

def index
  # params = { category: '34',
  # city: 'Austin',
  # zip: '78748',
  # status: 'upcoming',
  # format: 'json',
  # page: '3'}
  # meetup_api = MeetupApi.new
  # response = meetup_api.open_events(params)
  # @events = response['results']
  @post = Post.all.order("created_at DESC")
end

def show
  @comments = Comment.where(post_id: @post)
end

def new
  # Without devise
  # @post = Post.new
  # with devise
  @post = current_user.posts.build
end

def create
  @post = current_user.posts.build(post_params)

  if @post.save
    redirect_to @post
  else 
    render 'new'
  end
end

def edit
end

def update
  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
  @post.destroy
  redirect_to '/'
end

def upvote
  @post.upvote_by current_user
  redirect_back(fallback_location: root_path)
end

def downvote
  @post.downvote_by current_user
  redirect_back(fallback_location: root_path)
end

private

def find_post
  @post = Post.find(params[:id])
end

def post_params
  params.require(:post).permit(:title, :link, :description, :image)
end

end
