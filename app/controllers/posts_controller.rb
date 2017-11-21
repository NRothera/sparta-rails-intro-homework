class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        end
      end
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
