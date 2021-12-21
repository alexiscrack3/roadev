class LearningPathsController < ApplicationController
  before_action :set_learning_path, only: %i[ show edit update destroy ]

  # GET /learning_paths or /learning_paths.json
  def index
    @learning_paths = LearningPath.all
  end

  # GET /learning_paths/1 or /learning_paths/1.json
  def show
  end

  # GET /learning_paths/new
  def new
    @learning_path = LearningPath.new
  end

  # GET /learning_paths/1/edit
  def edit
  end

  # POST /learning_paths or /learning_paths.json
  def create
    @learning_path = LearningPath.new(learning_path_params)

    respond_to do |format|
      if @learning_path.save
        format.html { redirect_to @learning_path, notice: "Learning path was successfully created." }
        format.json { render :show, status: :created, location: @learning_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @learning_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_paths/1 or /learning_paths/1.json
  def update
    respond_to do |format|
      if @learning_path.update(learning_path_params)
        format.html { redirect_to @learning_path, notice: "Learning path was successfully updated." }
        format.json { render :show, status: :ok, location: @learning_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @learning_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_paths/1 or /learning_paths/1.json
  def destroy
    @learning_path.destroy
    respond_to do |format|
      format.html { redirect_to _learning_paths_url, notice: "Learning path was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_path
      @learning_path = LearningPath.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def learning_path_params
      params.fetch(:learning_path, {})
    end
end
