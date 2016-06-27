class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	def index
		@posts = Post.all
	end

	def show
		#@post = Post.find(params[:id])
		#@post = find_post
	end

	def new 
		@post = Post.new 
	end

	def create
		@post = Post.new post_params
		#render plain: params[:post].inspect
		if @post.save 
			redirect_to @post, notice: "seifa go "
		else 
			render 'new', notice: "Ne go seifa"
		end
	end	

	def edit
		#post = post_params
		#@post = Post.find(params[:id])
	end 

	def update
		#@post = Post.find(params[:id])
		if @post.update post_params
			redirect_to @post , notice: "Successfuly Update"
		
		else 
			render 'edit'
		end
	end

	def destroy
		#@post = post_params
		@post.destroy
		redirect_to post_path
	end



	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end	
end
