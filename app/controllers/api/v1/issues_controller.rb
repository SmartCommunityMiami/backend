class Api::V1::IssuesController < Api::ApiController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_issue, only: [:show, :update, :destroy]
  respond_to :json

  # GET /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1.json
  def show
  end

  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      render :show, status: :created, location: api_issue_url(@issue)
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /issues/1.json
  def update
    if @issue.update(issue_params)
      render :show, status: :ok, location: api_issue_url(@issue)
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:description, :department_id)
    end
end
