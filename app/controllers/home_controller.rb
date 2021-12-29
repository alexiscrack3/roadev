class HomeController < ApplicationController
  def index
    @learning_paths = LearningPath.all
  end
end
