React = require "react"

Panel = React.createClass
  propTypes:
    index: React.PropTypes.number
    className: React.PropTypes.string
    factory: React.PropTypes.object
    handler: React.PropTypes.func

  getInitialState: ->
    selectedIndex = @props.factory.getSelectedIndex()
    {
      selected: selectedIndex is @props.index
      childComponent: null
    }

  componentDidMount: ->
    @props.factory.addListener @_onFactoryUpdate

  componentWillUnmount: ->
    @props.factory.removeListener @_onFactoryUpdate

  _onFactoryUpdate: (index) ->
    selected = index is @props.index
    @setState selected: selected

  _getStyle: ->
    display = "none"
    display = "block" if @state.selected
    {display: display}

  _getChildComponent: ->
    return @state.childComponent if @state.childComponent?
    return null if !@state.selected
    element = <@props.handler />
    #@setState childComponent: element
    element

  render: ->
    <div className={@props.className} style={@_getStyle()}>
      {@_getChildComponent()}
    </div>

module.exports = Panel
