window.MyApp = MyApp ? {}

window.MyApp.itBehavesLike = (name, args...) ->
  switch name
    when 'controllers/translatable'
      window.MyApp.sharedSpecs.controllers.translatable args...
    when 'controllers/editable'
      window.MyApp.sharedSpecs.controllers.editable args...
    when 'Selectable'
      window.MyApp.sharedSpecs.controllers.selectable args...
    when 'Crudable'
      window.MyApp.sharedSpecs.controllers.crudable args...
    when 'SimpleCrudable'
      window.MyApp.sharedSpecs.services.simpleCrudable args...
    else
      throw "Unknown shared spec '#{name}'"

