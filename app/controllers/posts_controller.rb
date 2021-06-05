class PostsController < ApplicationController
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

    private
    def post_params
        params.require(:post).permit(:title, :station, :price, :access, :floor, :construction, :location, :build, :security, :equipment, :facility, :image).merge(owner_id: current_owner.id)
    end
end
