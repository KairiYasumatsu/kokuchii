class PostsController < ApplicationController
  def index
       @user=current_user
    if params[:search] == nil
        @posts = Post.all.order("id DESC")
      elsif params[:search] == ""
        @posts = Post.all.order("id DESC")
      else
        @posts = Post.where("title LIKE ? ", "%" + params[:search] + "%").or(Post.where("detail LIKE ? ", "%" + params[:search] + "%")).order("id DESC")
      end
  end

  def new
    @user=current_user
    @post=Post.new
  end

  def show
    @user=current_user
    @post=Post.find(params[:id])
    @like = Like.new
    @comments = @post.comments
    @comment = Comment.new

    prepare_meta_tags(og:{
      image: @post.image.to_s,

      })
    prepare_meta_tags(title: @post.title)
    prepare_meta_tags(twitter:{
      title: @post.title,
      image: @post.image.to_s,
      site_name: @post.title
      })
  end

  def create
    @post=Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to action: :index
  end


  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :detail, :image)
  end
end
