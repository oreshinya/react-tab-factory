React = require "react"

ReactTabFactory = require "../src/index.cjsx"
TabFactory = ReactTabFactory.TabFactory

# components
tabMixin =
  _getStyle: ->
    fontWeight = "normal"
    fontWeight = "bold" if @props.selected
    {fontWeight: fontWeight}

FirstTab = React.createClass
  mixins: [tabMixin]
  render: ->
    <span style={@_getStyle()}>Tab 1 {@props.opts.data}</span>

SecondTab = React.createClass
  mixins: [tabMixin]
  render: ->
    <span style={@_getStyle()}>Tab 2</span>

ThirdTab = React.createClass
  mixins: [tabMixin]
  render: ->
    <span style={@_getStyle()}>Tab 3(NestedTab)</span>

FirstPanel = React.createClass
  render: ->
    <div className="panel-content">Panel 1 {@props.opts.data}</div>

SecondPanel = React.createClass
  render: ->
    <div className="panel-content">Panel 2</div>

FirstNestedTab = React.createClass
  mixins: [tabMixin]
  render: ->
    <span style={@_getStyle()}>NestedTab 1</span>

SecondNestedTab = React.createClass
  mixins: [tabMixin]
  render: ->
    <span style={@_getStyle()}>NestedTab 2</span>

FirstNestedPanel = React.createClass
  render: ->
    <div className="nested-panel-content">NestedPanel 1</div>

SecondNestedPanel = React.createClass
  render: ->
    <div className="nested-panel-content">NestedPanel 2</div>


ThirdPanel = React.createClass
  getInitialState: ->
    factory = new TabFactory()
    factory.tabClassNames =
      normal: "nested-tab"
      active: "nested-tab active"

    factory.panelClassName = "nested-panel"
    {factory: factory}

  render: ->
    <div className="panel-content nested">
      <div className="nested-tab-container">
        {@state.factory.createTab FirstNestedTab}
        {@state.factory.createTab SecondNestedTab, null, selected: true}
      </div>
      <div className="nested-panel-container">
        {@state.factory.createPanel FirstNestedPanel}
        {@state.factory.createPanel SecondNestedPanel}
      </div>
    </div>

App = React.createClass
  getInitialState: ->
    factory = new TabFactory()
    factory.tabClassNames =
      normal: "tab"
      active: "tab active"

    factory.panelClassName = "panel"
    {factory: factory}

  render: ->
    <div id="app">
      <div className="tab-container">
        {@state.factory.createTab FirstTab, {data: 'tab data'}}
        {@state.factory.createTab SecondTab}
        {@state.factory.createTab ThirdTab}
      </div>
      <div className="panel-container">
        {@state.factory.createPanel FirstPanel, {data: 'panel data'}}
        {@state.factory.createPanel SecondPanel, null, preMount: true}
        {@state.factory.createPanel ThirdPanel}
      </div>
    </div>
# components end

window.addEventListener "load", ->
  content = document.querySelector "#content"
  React.render <App />, content
