class Rgt.Routers.ProjectsRouter extends Backbone.Router
  initialize: (options) ->
    @projects = new Rgt.Collections.ProjectsCollection(options.projects)
    @projects.reset options.projects
    @projects.bind 'reset', @index, @

  routes:
    "new"      : "newProjects"
    "index"    : "index"
    ":id/edit" : "edit"
    ".*"        : "index"

  newProjects: ->
    @view = new Rgt.Views.Projects.NewView(collection: @projects)
    $("#projects-dialog").html(@view.render().el)
    $("#projects-dialog").modal()

  index: ->
    @view = new Rgt.Views.Projects.IndexView(projects: @projects)
    $("#projects").html(@view.render().el)

  edit: (id) ->
    projects = @projects.get(id)
    @view = new Rgt.Views.Projects.EditView(model: projects)
    $("#projects-dialog").html(@view.render().el)
    $("#projects-dialog").modal()
