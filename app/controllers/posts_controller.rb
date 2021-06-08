class PostsController < ApplicationController
    before_action :authenticate_owner!, except: [:show, :index, :main]#サインインしていなくても閲覧可能
    before_action :set_post, only: [:show, :edit, :update, :destroy]#一緒のコードを一つにまとめる
    def main
    end
    
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
        else
            render :new
        end
    end

    def show
    end

    def edit
        unless current_owner == @post.owner#投稿者本人でなければ編集画面に遷移できない
            redirect_to action: :index
        end
    end

    def update
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
           render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private
    def post_params
        params.require(:post).permit(:title, :station, :price, :access, :floor, :construction, :location, :build, :security, :equipment, :facility, :image).merge(owner_id: current_owner.id)
    end
    
    def set_post
        @post = Post.find(params[:id])
    end
end
