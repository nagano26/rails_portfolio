class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @blog = Blog.new
  end

  def create
    @blogs = Blog.all
    @blog = Blog.new(blog_params)
  end

  private
  def blog_params
    params.require(:blog).permit(:title_blog, :body_blog)
  end
end
