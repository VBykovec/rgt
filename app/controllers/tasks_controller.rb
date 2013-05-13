class TasksController < ApplicationController
  respond_to :json
  inherit_resources
  load_and_authorize_resource
end
