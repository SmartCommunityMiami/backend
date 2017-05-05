class Api::V1::DepartmentsController < Api::ApiController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_department, only: [:show, :update, :destroy]
  respond_to :json

  # GET /departments.json
  def index
    @departments = Department.all
  end

  # GET /departments/1.json
  def show
  end

  # POST /departments.json
  def create
    @department = Department.new(department_params)
    if @department.save
      render :show, status: :created, location: api_department_url(@department)
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /departments/1.json
  def update
    if @department.update(department_params)
      render :show, status: :ok, location: api_department_url(@department)
    else
      render json: @department.errors, status: :unprocessable_entity
    end
    
  end

  # DELETE /departments/1.json
  def destroy
    @department.destroy
    head :no_content
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
