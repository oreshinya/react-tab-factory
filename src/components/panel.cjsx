React = require "react"

Panel = React.createClass
  propTypes:
    index: React.PropTypes.number
    className: React.PropTypes.string
    factory: React.PropTypes.object
    handler: React.PropTypes.func

  getInitialState: ->
    selectedIndex = @props.factory.getSelectedIndex()
    state = selected: selectedIndex is @props.index
    state.childComponent = <@props.handler /> if state.selected
    state

  componentDidMount: ->
    @props.factory.addListener @_onFactoryUpdate

  componentWillUnmount: ->
    @props.factory.removeListener @_onFactoryUpdate

  _onFactoryUpdate: (index) ->
    state = selected: index is @props.index
    state.childComponent = <@props.handler /> if state.selected and !@state.childComponent?
    @setState state

  _getStyle: ->
    display = "none"
    display = "block" if @state.selected
    {display: display}

  render: ->
    <div className={@props.className} style={@_getStyle()}>
      {@state.childComponent}
    </div>

module.exports = Panel
