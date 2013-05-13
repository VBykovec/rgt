class Rgt.Models.Projects extends Backbone.RelationalModel
  #paramRoot: 'project'
  defaults:
    name: null
  validation:
    name:
      required: true
      minLength: 1
      maxLength: 40
      msg: 'Please type project name'
  relations:[
    type: Backbone.HasMany
    key: 'tasks'
    relatedModel: 'Rgt.Models.Tasks'
    collectionType: Rgt.Collections.TasksCollections
    autoFetch: true
    reverseRelation:
      type: Backbone.HasOne
      key: 'project_id'
      includeInJSON: 'id'
    ]
Rgt.Models.Projects.setup()

class Rgt.Collections.ProjectsCollection extends Backbone.Collection
  model: Rgt.Models.Projects
  url: '/api/projects'
