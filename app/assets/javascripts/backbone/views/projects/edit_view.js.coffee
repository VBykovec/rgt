Rgt.Views.Projects ||= {}

class Rgt.Views.Projects.EditView extends Backbone.View
  template : JST["backbone/templates/projects/edit"]

  events :
    "submit #edit-projects" : "update"
    "click a.btn": "close_modal"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.set('name', $('#name').val())
    @model.validate()
    if @model.isValid()
      @model.save(null,
        success : (projects) =>
          @model = projects
          )
      @close_modal()
    else
      alert 'Project must have name'

  close_modal : () ->
    $(@el).parent().modal('hide')
    window.location.hash = "#index"
    

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    $(@el).parent().modal('show')
    Backbone.Validation.bind this
    @
