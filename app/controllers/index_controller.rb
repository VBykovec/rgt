class IndexController < ApplicationController
  def index
    if current_user
      @projects = current_user.projects
    end
    @projects ||= []
  end
end
