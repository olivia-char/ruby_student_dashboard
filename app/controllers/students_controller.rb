class StudentsController < ApplicationController
  def index
  end

  def new
  	@dojos = Dojo.all
  	@dojo = Dojo.find(params[:dojos_id])
  end

  def show
  	@dojo = Dojo.find(params[:dojos_id])
  	@student = Student.find(params[:id])
  end

  def edit
  	@dojos = Dojo.all
  	@dojo = Dojo.find(params[:dojos_id])
  	@student = Student.find(params[:id])
  end

  def create 
  	Student.create(student_params)
  	redirect_to "/dojos/#{params[:dojos_id]}"
  end 

  def update
  	Student.find(params[:id]).update(student_params)
  	redirect_to "/dojos/#{params[:dojos_id]}"
  end

  def destroy
  	Student.find(params[:id]).destroy
  	redirect_to '/dojos'
  end 

  private
  	def student_params
  		params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
  	end
end
