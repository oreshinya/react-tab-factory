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
tabMixin =
  _getStyle: ->
    fontWeight = "normal"
    fontWeight = "bold" if @props.selected
    {fontWeight: fontWeight}

FirstTab = React.createClass
  mixins: [tabMixin]
  render: ->
    <span style={@_getStyle()}>Tab 1</span>

SecondTab = React.createClass
  mixins: [tabMixin]
  render: ->
    <span style={@_getStyle()}>Tab 2</span>

ThirdTab = React.createClass
  mixins: [tabMixin]
  render: ->
    <span style={@_getStyle()}>Tab 3</span>

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
      {factory.createTab FirstTab}
      {factory.createTab SecondTab}
      {factory.createTab ThirdTab}
      {factory.createPanel FirstPanel}
      {factory.createPanel SecondPanel}
      {factory.createPanel ThirdPanel}
    </div>
# components end

window.addEventListener "load", ->
  content = document.querySelector "#content"
  React.render <App />, content
