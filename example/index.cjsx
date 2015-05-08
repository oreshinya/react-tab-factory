React = require "react"

TabFactory = require "../src/factory.cjsx"

# initialize factory
factory = new TabFactory()
factory.tabClassNames =
  normal: "tab"
  active: "tab active"

factory.panelClassName = "panel"
# initialize factory end

# components
FirstPanel = React.createClass
  render: ->
    <div>Panel 1</div>

SecondPanel = React.createClass
  render: ->
    <div>Panel 2</div>

ThirdPanel = React.createClass
  render: ->
    <div>Panel 3</div>

App = React.createClass
  render: ->
    <div id="app">
      {factory.createTab <div>tab 1</div>}
      {factory.createTab <div>tab 2</div>}
      {factory.createTab <div>tab 3</div>}
      {factory.createPanel FirstPanel}
      {factory.createPanel SecondPanel}
      {factory.createPanel ThirdPanel}
    </div>
# components end

window.addEventListener "load", ->
  content = document.querySelector "#content"
  React.render <App />, content
