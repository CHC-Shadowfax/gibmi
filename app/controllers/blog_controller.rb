class BlogController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.where(id: params[:id]).first
  end

  def create
    @blog = Blog.new(post_params)
    @blog.user = current_user
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(post_params)
      redirect_to blog_path(@blog), notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blog_path, notice: 'Blog was successfully destroyed.'
  end


  private

end
