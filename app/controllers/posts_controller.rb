class PostsController < ApplicationController
  #include Foo

  def index
    search = Post.search do
      fulltext 'blog'
    end
    @posts = search.results
  end

  # GET /posts/1
  # GET /posts/1.json

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to '/posts', :notice => 'Post was successfully created.' }
      end
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  # GET /posts
  # GET /posts.json


  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end


end
