class Admin::LearningPathsController < ApplicationController
  before_action :set_learning_path, only: %i[ show edit update destroy ]

  # GET /learning_paths
  def index
    @learning_paths = LearningPath.order(:created_at).reverse_order
  end

  # GET /learning_paths/1
  def show
    @learning_path = LearningPath.find_by(id: params[:id])
    respond_to do |format|
      format.html
      format.js { render action: "show" } # render specific template name
    end
  end

  # # GET /learning_paths/new
  def new
    @learning_path = LearningPath.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /learning_paths/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /learning_paths
  def create
    @learning_path = LearningPath.new(learning_path_params)

    respond_to do |format|
      if @learning_path.save
        format.html { redirect_to [:admin, @learning_path], notice: "Learning path was successfully created." }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /learning_paths/1
  def update
    respond_to do |format|
      if @learning_path.update(learning_path_params)
        format.html { redirect_to [:admin, @learning_path], notice: "Learning path was successfully updated." }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /learning_paths/1
  def destroy
    @learning_path.destroy
    respond_to do |format|
      format.html { redirect_to admin_learning_paths_url, notice: "Learning path was successfully destroyed." }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_path
      @learning_path = LearningPath.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def learning_path_params
      params.require(:learning_path).permit(:title, :description)
    end
end
