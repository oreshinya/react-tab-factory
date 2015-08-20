React = require "react"

Panel = React.createClass
  propTypes:
    index: React.PropTypes.number
    factory: React.PropTypes.object
    handler: React.PropTypes.func
    opts: React.PropTypes.object

  getInitialState: ->
    index = @props.factory.getSelectedIndex()
    selected = @_isSelected index
    {
      selected: selected
      initialSelected: selected
    }

  componentDidMount: ->
    @props.factory.addListener @_onFactoryUpdate

  componentWillUnmount: ->
    @props.factory.removeListener @_onFactoryUpdate

  _isSelected: (index) ->
    @props.index is index

  _onFactoryUpdate: (index) ->
    selected = @_isSelected index
    state = selected: selected
    if selected and !@state.initialSelected
      state.initialSelected = true
    @setState state

  _getPerformantStyle: ->
    style =
      position: "absolute"
      top: 0
      left: 0
      width: "100%"
      backgroundColor: "#FFFFFF"
      zIndex: -1

    if @state.selected
      style.zIndex = 0

    style

  _getNormalStyle: ->
    style =
      display: "none"

    if @state.selected
      style.display = "block"

    style

  _getStyle: ->
    if @_isPerformant()
      @_getPerformantStyle()
    else
      @_getNormalStyle()

  _isPerformant: ->
    @props.factory.performant

  _getClassName: ->
    @props.factory.panelClassName

  render: ->
    <div className={@_getClassName()} style={@_getStyle()}>
      {
        if @state.initialSelected
          <@props.handler selected={@state.selected} opts={@props.opts} />
      }
    </div>

module.exports = Panel
