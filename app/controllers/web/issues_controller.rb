class Web::IssuesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  layout 'web/layouts/application'
  respond_to :html

  # GET /issues
  def index
    @issues = Issue.all
  end

  # GET /issues/1
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  def create
    if user_signed_in?
      @issue = Issue.new(issue_params)
      if @issue.save
        redirect_to web_issue_path(@issue), notice: 'Issue was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /issues/1
  def update
    if user_signed_in?
      if @issue.update(issue_params)
        redirect_to web_issue_path(@issue), notice: 'Issue was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /issues/1
  def destroy
    if user_signed_in?
      @issue.destroy
      redirect_to web_issues_url, notice: 'Issue was successfully destroyed.'
    end
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
