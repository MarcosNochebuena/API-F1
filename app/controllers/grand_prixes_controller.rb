class GrandPrixesController < ApplicationController
  before_action :set_grand_prix, only: %i[ show update destroy ]

  # GET /grand_prixes
  def index
    @grand_prixes = GrandPrix.all

    render json: @grand_prixes
  end

  # GET /grand_prixes/1
  def show
    render json: @grand_prix
  end

  # POST /grand_prixes
  def create
    @grand_prix = GrandPrix.new(grand_prix_params)

    if @grand_prix.save
      render json: @grand_prix, status: :created, location: @grand_prix
    else
      render json: @grand_prix.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /grand_prixes/1
  def update
    if @grand_prix.update(grand_prix_params)
      render json: @grand_prix
    else
      render json: @grand_prix.errors, status: :unprocessable_entity
    end
  end

  # DELETE /grand_prixes/1
  def destroy
    @grand_prix.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grand_prix
      @grand_prix = GrandPrix.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def grand_prix_params
      params.expect(grand_prix: [ :name, :circuit_id, :date, :season_id, :round ])
    end
end
