class Rgt.Models.Tasks extends Backbone.RelationalModel
  validation:
    description:
      required: true
      minLength: 1
      maxLength: 40
      msg: 'Please type task description'
  initialize: ()->
    if @id
      @url = '/api/tasks/' + @id
    else
      @url = '/api/tasks/'


Rgt.Models.Tasks.setup()

class Rgt.Collections.TasksCollection extends Backbone.Collection
  model: Rgt.Models.Tasks
  url: '/api/tasks'
