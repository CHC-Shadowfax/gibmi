class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blogs = Blog.new
  end

  def show
    @blogs = Blog.where(id: params[:id]).first
  end

  def create
    @blogs = Blog.new(post_params)
    @blogs.user = current_user
    if @blogs.save
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blogs.update(post_params)
      redirect_to blog_path(@blogs), notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blogs.destroy
    redirect_to blog_path, notice: 'Blog was successfully destroyed.'
  end


  private

end
