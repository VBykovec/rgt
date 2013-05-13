Rgt.Views.Tasks ||= {}

class Rgt.Views.Tasks.TasksView extends Backbone.View
  template: JST["backbone/templates/tasks/tasks"]

  events:
    "click .destroy" : "destroy"
    "click .edit" : "edit"
    "click .task-up" : "task_up"
    "click .task-down" : "task_down"
    "change :checkbox" : "checkbox"
  
  initialize: ()->
    _.bindAll(@,'render')
    @model.bind('change',@render)

  className: 'project-task'
  tagName: "div"

  task_up: ()->
    $(@el).prev('.project-task').insertAfter($(@el))
    models = @model.collection.models
    my_index = _.indexOf(models, @model)
    if my_index > 0
      model1 = models[my_index-1]
      pos1 = @model.get('position')
      @model.set 'position', model1.get('position')
      model1.set 'position', pos1
      model1.save()
      @model.save()
    false

  task_down: ()->
    $(@el).next('.project-task').insertBefore($(@el))
    models = @model.collection.models
    my_index = _.indexOf(models, @model)
    if my_index < models.length - 2
      model1 = models[my_index+1]
      pos1 = @model.get('position')
      @model.set 'position', model1.get('position')
      model1.set 'position', pos1
      model1.save()
      @model.save()
    false

  checkbox: () ->
    @model.set('status', $(@el).find(':checkbox').is(':checked'))
    @model.save()
    @render()

  destroy: () ->
    @model.destroy()
    this.remove()

    return false
  edit: () ->
    @view = new Rgt.Views.Tasks.EditView(model: @model)
    $("#projects-dialog").html(@view.render().el)
    $("#projects-dialog").modal()

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
