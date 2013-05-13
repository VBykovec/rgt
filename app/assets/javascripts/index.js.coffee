# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$(document).on 'click', '#login', ()->
  $.ajax
    url: $('#auth form').attr('action') + '.json'
    type: 'POST'
    data: $('#auth form').serialize()
    success: (result)->
      if result.success
        $('#auth').modal('hide')
        $.get '/api/projects', (nprojects)->
          console.log nprojects
          window.router = new Rgt.Routers.ProjectsRouter({projects: nprojects})
          Backbone.history.start()
      else
        console.log result
        alert result.errors
    error: (result)->
      console.log JSON.parse(result.responseText)
      alert JSON.parse(result.responseText)['error']
  false
