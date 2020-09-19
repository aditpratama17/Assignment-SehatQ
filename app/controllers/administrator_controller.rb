class AdministratorController < ApplicationController
	before_action :authenticate_administrator, only: [ :index, :show, :update, :delete ]
	before_action :set_administrator, only: [ :show, :update, :delete ]
	def index
	  @administrator = Administrator.all
	  render json: { result: true, administrator: @administrator }, status: :ok
	 end
	def show
	  render json: { result: true, administrator: @administrator } 
	 end
	def create
	  @administrator = Administrator.create(administrator_param)
	  if @administrator.save
	   render json: { result: true, administrator: @administrator }, status: :created
	  else
	   render json: { result: false, administrator: @administrator.errors }, status: :unprocessable_entity
	  end
	end
	def update
	  if @administrator.update(administrator_param)
	   render json: { result: true, msg: "Update Success "}
	  else 
	   render json: { result: false, msg: "Update Failed "}
	  end
	 end
	def delete
	 if @administrator.destroy
	  render json: { result: true, msg: "Delete Success" }
	 else
	  render json: { result: false, msg: "Delete Failed" }
	 end
	end
	private
	 def administrator_param
	  params.require(:administrator).permit(:username,:email,:password,:password_confirmation)
	 end
	def set_administrator
	  @administrator = current_administrator
	 end

end
