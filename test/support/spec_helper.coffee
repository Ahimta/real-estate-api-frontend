window.MyApp = MyApp ? {}

window.MyApp.itBehavesLike = (name, args...) ->
  switch name
    when 'Selectable' then Selectable args...
    when 'Crudable' then Crudable args...
    
  