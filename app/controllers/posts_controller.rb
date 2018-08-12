class PostsController < ApplicationController
  before_action  :authorize, :set_post, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

  end

  def not_found
    render file: 'public/404', status: 404, formats: [:html]

  end
  # GET /posts/1
  # GET /posts/1.json

  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.'}
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  # @return [Object]
  def set_post
      categories = ["CSS Tricks", "Things I've learned",  "How I stay sharp", "all"];
      if params[:id].in?(categories)
        expandedCategory = '';
        cat = params[:id]

        case when cat =="csstricks" then expandedCategory='CSS Tricks' end
        case when cat=="thingsivelearned" then expandedCategory="Things I've learned" end
        case when cat=="howistaysharp" then expandedCategory="How I stay sharp" end

        @posts = Post.where category: expandedCategory; #raise Exception #if @post != Post.all;
        render template: 'posts/index', variable: @posts
        return @posts
        else
          @post = Post.find(params[:id])
      end
      end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :article, :preview, :category, :image_url)
    end

  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: 'Please log in'
    end
  end
end
