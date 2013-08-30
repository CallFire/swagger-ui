class SidebarView extends Backbone.View
  events: {
    'click .toggle-icon'  : 'toggleSidebar'
  }
  initialize: ->

  render: ->
    $(@el).html(Handlebars.templates.sidebar(@model))

    @

  toggleSidebar: (e)->
    console.log(e.target)
    elem = $(e.target)
    if (elem.hasClass('icon-chevron-right') or elem.hasClass('icon-chevron-down'))
      if elem.hasClass('icon-chevron-right')
        elem.removeClass('icon-chevron-right').addClass('icon-chevron-down')
        elem.parent().siblings('ul.sidebar_endpoints').slideDown()
      else
        elem.removeClass('icon-chevron-down').addClass('icon-chevron-right')
        elem.parent().siblings('ul.sidebar_endpoints').slideUp()
    else
      if elem.children('i').hasClass('icon-chevron-right')
        elem.children('i').removeClass('icon-chevron-right').addClass('icon-chevron-down')
        elem.siblings('ul.sidebar_endpoints').slideDown()
      else
        elem.children('i').removeClass('icon-chevron-down').addClass('icon-chevron-right')
        elem.siblings('ul.sidebar_endpoints').slideUp()