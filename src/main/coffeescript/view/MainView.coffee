class MainView extends Backbone.View
  initialize: ->

  render: ->
    # Render the outer container for resources
    $(@el).html(Handlebars.templates.main(@model))

    # Render each resource
    @addResource resource for resource in @model.apisArray
    @addSidebar sidebar for sidebar in @model.apisArray

  addResource: (resource) ->
    # Render a resource and add it to resources li
    resourceView = new ResourceView({model: resource, tagName: 'li', id: 'resource_' + resource.name, className: 'resource'})
    $('#resources').append resourceView.render().el

  addSidebar: (sidebar) ->
    sidebarView = new SidebarView({model: sidebar, tagName: 'li', id: 'sidebar_' + sidebar.name, className: 'sidebar_item'})
    $('#sidebar_resources').append sidebarView.render().el

  clear: ->
    $(@el).html ''