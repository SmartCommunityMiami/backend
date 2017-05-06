class Api::V1::ReportsController < Api::ApiController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_report, only: [:show, :update, :destroy]
  respond_to :json

  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1.json
  def show
  end

  # POST /reports.json
  def create
    @report = Report.new(report_params)
    if @report.save
      render :show, status: :created, location: api_report_url(@report)
    else
      render json: @report.errors, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /reports/1.json
  def update
    if @report.update(report_params)
      render :show, status: :ok, location: api_report_url(@report)
    else
      render json: @report.errors, status: :unprocessable_entity 
    end
  end

  # DELETE /reports/1.json
  def destroy
    @report.destroy
    head :no_content 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:issue_id, :description, :user_id, :picturelink, :latitude, :longitude)
    end
end
