React = require "react"

TabFactory = require "../src/factory.cjsx"

factory = new TabFactory()
factory.tabClassNames =
  normal: "tab"
  active: "tab active"

App = React.createClass
  render: ->
    <div id="app">
      {factory.createTab <div>tab 1</div>}
      {factory.createTab <div>tab 2</div>}
      {factory.createTab <div>tab 3</div>}
    </div>

window.addEventListener "load", ->
  content = document.querySelector "#content"
  React.render <App />, content
