Rgt.Views.Tasks ||= {}

class Rgt.Views.Tasks.EditView extends Backbone.View
  template : JST["backbone/templates/tasks/edit"]

  events :
    "submit #edit-task" : "update"
    "click a.btn": "close_modal"
  close_modal : () ->
    $(@el).parent().modal('hide')
    false

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    if $('#name').val() == ''
      alert 'Task must have description'
      return
    @model.set('description', $('#name').val())
    @model.set('deadline', $('#deadline').val())

    @model.save(null,
      success : (tasks) =>
        @model = tasks
    )
    $("#projects-dialog").modal('hide')

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    $(@el).find('.date').datepicker()
    return this
