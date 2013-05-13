Rgt.Views.Projects ||= {}

class Rgt.Views.Projects.IndexView extends Backbone.View
  template: JST["backbone/templates/projects/index"]
  className: 'projects'

  initialize: () ->
    @options.projects.fetch()

  addAll: () =>
    @options.projects.each(@addOne)

  addOne: (projects) =>
    view = new Rgt.Views.Projects.ProjectsView({model : projects})
    @$(".projects").append(view.render().el)

  render: =>
    $(@el).html(@template(projects: @options.projects.toJSON() ))
    @addAll()
    return this
