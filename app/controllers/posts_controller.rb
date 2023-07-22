class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post.all)
    @top_posts = [Post.find(39), Post.find(37), Post.find(35), Post.find(36), Post.find(38)]
    @posts = Post.order(:title).page params[:page]
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
    @post.update views_count: @post.views_count + 1
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post= Post.new(post_params)
    @post.user = current_user

    authorize @post

    if @post.save
      redirect_to posts_path
    else
      render :new, alert: "Something went wrong"
    end
  end

  def edit
    @post = authorize Post.find(params[:id])
  end

  def update
    @post = authorize Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = authorize Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted.", status: :see_other
  end

  private


 def post_params
   params.require(:post).permit(:title, :content, :photo)
 end

end
