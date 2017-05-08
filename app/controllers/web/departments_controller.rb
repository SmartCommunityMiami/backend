class Web::DepartmentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  layout 'web/layouts/application'
  respond_to :html

  # GET /departments
  def index
    @departments = Department.all
  end

  # GET /departments/1
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  def create
    if user_signed_in?
      @department = Department.new(department_params)
      if current_user.isAdmin == true and @department.save
        redirect_to web_department_path(@department), notice: 'Department was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /departments/1
  def update
    if user_signed_in?
      @department = Department.find(params[:id])
      if current_user.isAdmin == true and @department.update(department_params)
        redirect_to web_department_path(@department), notice: 'Department was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /departments/1
  def destroy
    if user_signed_in?
      @department.destroy
      redirect_to web_departments_url, notice: 'Department was successfully destroyed.' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:name, :email, :phone, :organization)
    end
end
