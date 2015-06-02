React = require "react"

Panel = React.createClass
  propTypes:
    index: React.PropTypes.number
    className: React.PropTypes.string
    factory: React.PropTypes.object
    handler: React.PropTypes.func
    opts: React.PropTypes.object

  getInitialState: ->
    selectedIndex = @props.factory.getSelectedIndex()
    @_createStateWithNewIndex selectedIndex

  componentDidMount: ->
    @props.factory.addListener @_onFactoryUpdate

  componentWillUnmount: ->
    @props.factory.removeListener @_onFactoryUpdate

  _onFactoryUpdate: (index) ->
    state = @_createStateWithNewIndex index
    @setState state

  _createStateWithNewIndex: (newIndex) ->
    state = selected: newIndex is @props.index
    if state.selected and !@state?.childComponent?
      state.childComponent = <@props.handler opts={@props.opts} />
    state

  _getStyle: ->
    display = "none"
    display = "block" if @state.selected
    {display: display}

  render: ->
    <div className={@props.className} style={@_getStyle()}>
      {@state.childComponent}
    </div>

module.exports = Panel
