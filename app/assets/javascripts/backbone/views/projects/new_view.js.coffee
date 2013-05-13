Rgt.Views.Projects ||= {}

class Rgt.Views.Projects.NewView extends Backbone.View
  template: JST["backbone/templates/projects/new"]

  events:
    "submit #new-project": "save"
    "click a.btn": "close_modal"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  close_modal : () ->
    $(@el).parent().modal('hide')

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")
    @model.set('name', $('#name').val())
    @model.validate()
    if @model.isValid(true)
      @collection.create(@model,
        success: (projects) =>
          @model = projects
          window.location.hash = "#"
          @close_modal()
        error: (projects, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )
    else
      alert @model.errors

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    Backbone.Validation.bind this
    return this
