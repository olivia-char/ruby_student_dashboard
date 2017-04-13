class DojosController < ApplicationController
  def index
  	@dojos = Dojo.all
  end

  def edit
  	@dojo = Dojo.find(params[:id])
  end

  def show
  	@dojo = Dojo.find(params[:id])
  	@students = @dojo.students
  end

  def new
  end

  def create
  	Dojo.create(dojos_params)
  	redirect_to '/dojos'
  end 

  def update
  	Dojo.find(params[:id]).update(dojos_params)
  	redirect_to '/dojos'
  end

  def destroy
  	Dojo.find(params[:id]).destroy
  	redirect_to "/dojos"
  end 

  private 
  	def dojos_params 
  		params.require(:dojo).permit(:branch, :street, :city, :state)
  	end 
end
