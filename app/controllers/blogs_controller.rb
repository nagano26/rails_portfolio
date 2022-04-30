class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to blog_path(@blog), notice:"登録ありがとうございます"
    else
      render :new
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title_blog, :body_blog, :blog_image)
  end
end
