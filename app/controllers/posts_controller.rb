class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post =Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        # render plain: params[:post].inspect
        @post = Post.new(post_params)
        
        respond_to do |format|
            if (@post.save)
                format.html { redirect_to post_url(@post), notice: 'Post created successfully!' }
                format.json { render :show, status: :created, location: @post }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        respond_to do |format|
            if (@post.update(post_params))
                format.html { redirect_to post_url(@post), notice: 'Post updated successfully!' }
                format.json { render :show, status: :created, location: @post }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        respond_to do |format|
            format.html { redirect_to posts_url, notice: 'Post successfully deleted!' }
            format.json { head :no_content }

        end
    end

    private def post_params
        params.require(:post).permit(:title, :body)
    end
end
