class BirdsController < ApplicationController
  wrap_parameters format: {}

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  def create
    # byebug
    bird = Bird.create(allowed_params)
    render json: bird, status: :created

    # bird = Bird.create(name: params[:name], species: params[:species])
    # render json: bird, status: :created
  end

  private
  def allowed_params
    params.permit(:name, :species)
  end

end