class DashboardController < ApplicationController
  def index
    @learning_paths = LearningPath.all
  end
end
