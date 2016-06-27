class ProjectsController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy]
	def index
		@projects = Project.all.order("created_at desc")
	end
	def show
		
	end

	def new 
		@project = Project.new 
	end

	def create
		@project = Project.new project_params
		if @project.save 
			redirect_to @project, notice: "seifa go "
		else 
			render 'new', notice: "Ne go seifa"
		end
	end	

	def edit
		
	end 

	def update
		#@project = project.find(params[:id])
		if @project.update project_params
			redirect_to @project , notice: "Successfuly Update"
		
		else 
			render 'edit'
		end
	end

	def destroy
		#@project = project_params
		@project.destroy
		redirect_to project_path
	end



	private

	def find_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:title, :description, :link)
	end	

end
