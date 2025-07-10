class TeamPrincipalsController < ApplicationController
  before_action :set_team_principal, only: %i[ show update destroy ]

  # GET /team_principals
  def index
    @team_principals = TeamPrincipal.all

    render json: @team_principals
  end

  # GET /team_principals/1
  def show
    render json: @team_principal
  end

  # POST /team_principals
  def create
    @team_principal = TeamPrincipal.new(team_principal_params)

    if @team_principal.save
      render json: @team_principal, status: :created, location: @team_principal
    else
      render json: @team_principal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /team_principals/1
  def update
    if @team_principal.update(team_principal_params)
      render json: @team_principal
    else
      render json: @team_principal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /team_principals/1
  def destroy
    @team_principal.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_principal
      @team_principal = TeamPrincipal.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def team_principal_params
      params.expect(team_principal: [ :first_name, :last_name, :comun_name, :nationality, :birthday, :team_id ])
    end
end
