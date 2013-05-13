Rgt.Views.Projects ||= {}

class Rgt.Views.Projects.ProjectsView extends Backbone.View
  template: JST["backbone/templates/projects/projects"]
  className: 'project'

  events:
    "click .destroy" : "destroy"
    "click .my-btn" : "add_task"
    "click .add-task" : "add_task"
    "submit form" : "add_task"

  initialize: () ->
    _.bindAll this, 'render', 'render_tasks'
    @model.bind 'add:tasks', @render_tasks

  render_tasks: (tasks)=>
    view = new Rgt.Views.Tasks.TasksView({model : tasks})
    $(@el).append(view.render().el)

  destroy: () ->
    @model.destroy()
    this.remove()

    return false
  add_task: (e) ->
    e.preventDefault()
    e.stopPropagation()
    val = $(@el).find('input').val()
    if val!=''
      $(@el).find('input').val('')
      task = new Rgt.Models.Tasks {project_id: @model.id, description: val }
      task.save()
    else
      alert 'Task must have description'

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @model.get('tasks').each @render_tasks
    @
