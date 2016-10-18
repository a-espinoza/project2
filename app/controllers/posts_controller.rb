  class PostsController < ActionController::Base
#defined in private!
before_action :set_post, only: [:show, :edit, :update, :destroy]

#collect all posts in one view
def index
  @posts = Post.all
 end

def new
  @post = Post.new
end

def create
  if @post = Post.create(post_params)
    flash[:success] = "YEAH! Your post has been added :)!"
    redirect_to posts_path
  else
    flash.now[:alert] = "Bummer, something went wrong!  But try uploading a pic again!!"
    render :new
  end
end


def show
  @post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id])
end

def update
   if @post.update(post_params)
     flash[:success] = "Hoorayy! Your post has been updated."
     redirect_to posts_path
   else
     flash.now[:alert] = "Ohh no!! Update failed.  But go ahead and try again!"
     render :edit
   end
 end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
end

private

#Prevent from allowing diffrent kinds of files.. Image and text for caption!
def post_params
  params.require(:post).permit(:image, :caption)
end
#find de specific post im looking for!
def set_post
  @post = Post.find(params[:id])
end
end
