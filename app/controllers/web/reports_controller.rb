class Web::ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  layout 'web/layouts/application'
  respond_to :html

  # GET /reports
  def index
    @reports = Report.all
  end

  # GET /reports/1
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  def create
    if user_signed_in?
      @report = Report.new(report_params)
      if @report.save
        redirect_to web_report_path(@report), notice: 'Report was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /reports/1
  def update
    if user_signed_in?
      if @report.update(report_params)
        redirect_to web_report_path(@report), notice: 'Report was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /reports/1
  def destroy
    if user_signed_in?
      @report.destroy
      redirect_to web_reports_path, notice: 'Report was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:issue_id, :description, :user_id, :picture_link, :latitude, :longitude, :date_resolved)
    end
end
