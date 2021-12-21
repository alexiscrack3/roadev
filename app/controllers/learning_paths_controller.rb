class LearningPathsController < ApplicationController
  before_action :set_learning_path, only: %i[ show ]

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_path
      @learning_path = LearningPath.find(params[:id])
    end
end
