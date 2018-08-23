class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
        binding.pry
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    @post.save
    binding.pry
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name], comments_attributes: [:content])
  end
end
